if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Waiting for the Headless Client stabilization before sending the register request"] call CTI_CO_FNC_Log };

//--- Wait for the headless client to "stabilize" itself
/*sleep (30 + random 1);*/

while {isNull player} do {
	sleep 5;
	if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", format["Waiting for Headless Client player object to be non-null: %1", player]] call CTI_CO_FNC_Log };
};

//--- Benny Debug
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["DEBUG", "FILE: Client\Init\Init_Client_Headless.sqf", format["HC is [%1] in group [%2] on side [%3]", player, group player, side player]] call CTI_CO_FNC_Log;
};

//--- PVF
if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Attempting to register this Headless Client on the server..."] call CTI_CO_FNC_Log };
["SERVER", "Request_HCRegister", player] call CTI_CO_FNC_NetSend;

with missionNamespace do {
	CTI_PVF_Client_OnRegisterAnswer = {
		if (_this) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FUNCTION: CTI_PVF_Client_OnRegisterAnswer", "The Headless Client has been registered"] call CTI_CO_FNC_Log};
		} else {
			if (CTI_Log_Level >= CTI_Log_Error) then {["ERROR", "FUNCTION: CTI_PVF_Client_OnRegisterAnswer", "The Headless Client could not be registered"] call CTI_CO_FNC_Log};
		};
	};
	
	CTI_PVF_Client_OnTownDelegationReceived = {
		private ["_groups", "_positions", "_side", "_teams", "_town", "_town_vehicles"];
		
		_town = _this select 0;
		_side = _this select 1;
		_teams = _this select 2;
		_groups = _this select 3;
		_positions = _this select 4;
		
		if (CTI_Log_Level >= CTI_Log_Debug) then {
			["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationReceived", format["A Delegation request was received from the server for [%1] teams in town [%2] on [%3]", count _teams, _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
		};
		
		_town_vehicles = [_town, _side, _teams, _groups, _positions] call CTI_CO_FNC_CreateTownUnits;
		
		if (count _town_vehicles > 0) then {
			["SERVER", "Request_TownAddVehicles", [_town, _side, _town_vehicles]] call CTI_CO_FNC_NetSend;
		};
		
		{
			_x spawn {
				while {count units _this > 0} do {sleep 5}; 
				deleteGroup _this;
			};
		} forEach _groups; //--- Delete the group client-sided.
		
		//--- CAS Module, delegated
		if ( (missionNamespace getVariable 'CTI_SM_TCAS') <= (_town getVariable "cti_town_value")) then {
			_town setVariable["CTI_CAS",(_town) call SM_TCAS_CREATE,true];
		};
	};
};

CTI_Init_HC = true;

//Old Code
/*
CTI_SM_Mortars_script = compileFinal preprocessFileLineNumbers "Addons\Strat_mode\Functions\SM_Mortar.sqf";
TR_PROJ_HANDLER = compileFinal preprocessFileLineNumbers "Addons\Strat_mode\Functions\TR_proj_handler.sqf";
TR_HANDLER = compileFinal preprocessFileLineNumbers "Addons\Strat_mode\Functions\TR_handler.sqf";


0 execVM "Addons\Strat_mode\Functions\SM_Town_CAS.sqf";
CENTER_POS=getMarkerPos "CENTER_POS";
CENTER_RADIUS=(getMarkerSize "CENTER_POS")select 0;
HELO_STARTUP=[];
_i=0;
while {! (((getMarkerPos format ["HELO_START_%1", _i])select 0) == 0)} do
{
    if (((getMarkerPos format ["HELO_START_%1", _i]) distance CENTER_POS)<CENTER_RADIUS) then { HELO_STARTUP set [count HELO_STARTUP,getMarkerPos format ["HELO_START_%1", _i]]};
    _i=_i+1;
};

// Patrols
if ( (missionNamespace getVariable 'CTI_SM_PATROLS')==1) then {
	0 execVM "Addons\Strat_mode\PATROL_AI\PAI_Init.sqf";
};
*/
