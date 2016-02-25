private ["_side", "_u"];

_side = _this;

missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_officer_F"];
missionNamespace setVariable [format["CTI_%1_Worker", _side], "C_scientist_F"];

missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_Soldier_F"];
missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_crew_F"];
missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_Helipilot_F"];

missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [
	["O_Truck_03_medical_F", [
		["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
		["launch_RPG32_F", 5], ["RPG32_F", 20],
		["HandGrenade", 20],
		["30Rnd_556x45_Stanag", 15],
		["30Rnd_65x39_caseless_green_mag_Tracer", 6],
		["1Rnd_HE_Grenade_shell", 24],
		["UGL_FlareRed_F", 27],
		["1Rnd_SmokeRed_Grenade_shell", 9],
		["SmokeShellRed", 8],
		["firstaidkit", 20],
		["Chemlight_red", 36],
		["acc_flashlight", 5],
		["optic_ACO_grn", 3],
		["optic_Holosight", 2],
		["optic_MRCO", 1],
		["Toolkit", 1],
		["B_Kitbag_cbr", 4]
	]],
	["O_MRAP_02_F", [	["Toolkit", 1],["firstaidkit", 10],["30Rnd_556x45_Stanag", 15],["launch_RPG32_F", 5], ["RPG32_F", 20]]]
	//,	["O_Heli_Light_02_unarmed_F", []]
]];

//--- Units - Barracks

_u =  ['O_soldier_AR_F'];
_u = _u		+ ['O_Soldier_lite_F'];
_u = _u		+ ['O_Soldier_A_F'];
_u = _u		+ ['O_soldier_exp_F'];
_u = _u		+ ['O_Soldier_GL_F'];
_u = _u		+ ['O_soldier_M_F'];
_u = _u		+ ['O_medic_F'];
_u = _u		+ ['O_Soldier_F'];
_u = _u		+ ['O_soldier_PG_F'];
_u = _u		+ ['O_engineer_F'];
_u = _u		+ ['O_sniper_F'];
_u = _u		+ ['O_soldier_repair_F'];
_u = _u		+ ['O_soldier_LAT_F'];
_u = _u		+ ['O_soldier_AA_F'];
_u = _u		+ ['O_soldier_AT_F'];
_u = _u		+ ['O_spotter_F'];
_u = _u		+ ['O_soldier_UAV_F'];
_u = _u		+ ['O_Helipilot_F'];
_u = _u		+ ['O_crew_F'];
_u = _u		+ ['Land_Pod_Heli_Transport_04_bench_F'];
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _u];

_u 			= ['O_Quadbike_01_F'];
_u = _u		+ ["O_G_Offroad_01_F"];
_u = _u		+ ["O_G_Offroad_01_armed_F"];
_u = _u		+ ['O_Truck_02_transport_F'];
_u = _u		+ ['O_Truck_03_transport_F'];
_u = _u		+ ['O_MRAP_02_F'];
_u = _u		+ ['O_MRAP_02_hmg_F'];
_u = _u		+ ['O_MRAP_02_gmg_F'];
_u = _u		+ ['O_UGV_01_F'];
_u = _u		+ ['O_UGV_01_rcws_F'];
_u = _u		+ ['O_Truck_03_medical_F'];
_u = _u		+ ['Land_Pod_Heli_Transport_04_medevac_F'];
_u = _u		+ ['O_Truck_03_device_F'];


/*
_u = _u		+ ['C_Van_01_transport_F']; //SS83 Omon's Cars
_u = _u		+ ['C_Kart_01_F'];
_u = _u		+ ['C_Hatchback_01_sport_F'];
_u = _u		+ ['C_Hatchback_01_F'];
_u = _u		+ ['I_MRAP_03_F'];
_u = _u		+ ['I_MRAP_03_hmg_F'];
_u = _u		+ ['I_MRAP_03_gmg_F']; 
*/

_u = _u		+ ['Cha_BRDM2_HQ_DDR'];
_u = _u		+ ['Cha_BRDM2_DDR'];
_u = _u		+ ['Cha_BRDM2_ATGM_DDR'];
_u = _u		+ ['Cha_BTR60_DDR'];

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _u];

_u 			= ["O_APC_Tracked_02_cannon_F"];
_u = _u		+ ['O_APC_Wheeled_02_rcws_F'];
_u = _u		+ ["O_MBT_02_cannon_F"];
_u = _u		+ ["O_APC_Tracked_02_AA_F"];
_u = _u		+ ["RDS_T55_AAF_01"];
_u = _u		+ ["RDS_T72_AAF_02"];
_u = _u		+ ["RDS_T72B_AAF_01"];
_u = _u		+ ["pook_ZSUM4_GUE"];
if !(MADE_FOR_STRATIS) then
{_u = _u		+ ["O_MBT_02_arty_F"];  
 _u = _u		+ ["B_MBT_01_mlrs_F"];  
};
/*
_u = _u		+ ['I_APC_Wheeled_03_cannon_F'];
_u = _u		+ ['I_APC_tracked_03_cannon_F'];
_u = _u		+ ['I_MBT_03_cannon_F'];
*/
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _u];

_u 			= ['O_Heli_Transport_04_F']; 
_u = _u		+ ['O_Heli_Light_02_unarmed_F'];
_u = _u		+ ['O_Heli_Light_02_F'];
_u = _u		+ ["I_Heli_light_03_unarmed_F"]; //ss83 added mobile respawn heli 
_u = _u		+ ['I_Heli_Transport_02_F']; //ss83 mohawk
_u = _u		+ ["O_Heli_Transport_04_ammo_F"];
_u = _u		+ ["O_Heli_Transport_04_bench_F"];
_u = _u		+ ["O_Heli_Transport_04_covered_F"];
_u = _u		+ ["O_Heli_Transport_04_medevac_F"];
_u = _u		+ ["O_Heli_Transport_04_repair_F"];
_u = _u		+ ['O_UAV_02_CAS_F'];
_u = _u		+ ['O_UAV_02_F'];
_u = _u		+ ['O_Heli_Attack_02_F'];
_u = _u		+ ['O_Heli_Attack_02_black_F'];
/*
_u = _u		+ ['I_Heli_light_03_F'];
_u = _u		+ ['I_Plane_Fighter_03_CAS_F'];
*/
_u = _u		+ ['I_Plane_Fighter_03_AA_F'];
_u = _u		+ ['O_Plane_CAS_02_F'];

_u = _u		+ ['sab_t28trojan_O'];
_u = _u		+ ['sab_C130_H_CSAT'];
_u = _u		+ ['globemaster_c17_Qatar'];
_u = _u		+ ['bwi_a3_t6a_5'];
_u = _u		+ ['bwi_a3_at6b_2'];
_u = _u		+ ['sab_SU34_O_AGM'];
_u = _u		+ ['sab_SU34_O_BMB'];
_u = _u		+ ['sab_SU34_O_CAP'];
_u = _u		+ ['sab_SU34_O_CAS'];
_u = _u		+ ['sab_SU34_O_LGB'];
_u = _u		+ ['Cha_Mi24_P_CSAT'];
_u = _u		+ ['Cha_Mi24_V_CSAT'];
_u = _u		+ ['O_UCSV_01'];

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _u];

_u 			= ["O_Truck_02_box_F"];
_u = _u		+ ["O_Truck_03_repair_F"];
_u = _u		+ ["CTI_Salvager_East"];
_u = _u		+ ["O_Truck_02_fuel_F"];
_u = _u		+ ["O_Truck_03_fuel_F"];
_u = _u		+ ["Land_Pod_Heli_Transport_04_repair_F"];
_u = _u		+ ["Land_Pod_Heli_Transport_04_fuel_F"];
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _u];

_u 			= ["O_Truck_02_Ammo_F"];
_u = _u		+ ["O_Truck_03_Ammo_F"];
_u = _u		+ ["O_supplyCrate_F"];
_u = _u		+ ["Land_Pod_Heli_Transport_04_ammo_F"];
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _u];

_u 			= ['O_Boat_Transport_01_F'];
_u = _u		+ ['O_Boat_Armed_01_hmg_F'];
_u = _u		+ ['C_Boat_Civil_01_rescue_F'];
_u = _u		+ ["Burnes_MK10_1"];
_u = _u		+ ["O_CBS_WaterShadow730_F"];
_u = _u		+ ['O_SDV_01_F'];
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _u];


//--- Units - FLAG


/*_u = _u		+ ['Box_East_Wps_F'];
_u = _u		+ ['Box_East_Ammo_F'];
_u = _u		+ ['Box_East_Support_F'];
_u = _u		+ ['Box_East_Grenades_F'];
_u = _u		+ ['Box_East_AmmoOrd_F'];
_u = _u		+ ['Box_East_WpsLaunch_F'];
_u = _u		+ ['Box_East_WpsSpecial_F'];
_u = _u		+ ['O_supplyCrate_F'];
//_u = _u		+ ['Land_Pod_Heli_Transport_04_repair_F'];

*/

_u = ['O_Soldier_lite_F'];
_u = _u		+ ['C_Van_01_transport_F']; //SS83 Omon's Cars
_u = _u		+ ['C_Kart_01_F'];
_u = _u		+ ['C_Hatchback_01_sport_F'];
_u = _u		+ ['C_Hatchback_01_F'];
_u = _u		+ ['O_Quadbike_01_F'];
_u = _u		+ ['O_G_Offroad_01_F'];
_u = _u		+ ['O_G_Offroad_01_armed_F'];
_u = _u		+ ['O_Boat_Transport_01_F'];


missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_FTOWN], _u];
