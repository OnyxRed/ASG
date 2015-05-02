/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {45};
	case "C_Hatchback_01_F": {60};
	case "C_Hatchback_01_sport_F": {65};
	case "C_SUV_01_F": {80};
	case "C_Van_01_transport_F": {100};
	case "B_G_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "C_Boat_Civil_01_F": {105};
	case "C_Boat_Civil_01_police_F": {105};
	case "C_Boat_Civil_01_rescue_F": {105};
	case "B_MRAP_01_F": {300};
	case "O_MRAP_02_F": {80};
	case "I_MRAP_03_F": {78};
	case "B_Heli_Light_01_F": {110};
	case "C_Heli_Light_01_civil_F": {80};
	case "O_Heli_Light_02_unarmed_F": {300};
	case "I_Heli_Transport_02_F": {600};
	case "C_Rubberboat": {65};
	case "O_Boat_Armed_01_hmg_F": {195};
	case "B_Boat_Armed_01_minigun_F": {195};
	case "I_Boat_Armed_01_minigun_F": {195};
	case "B_G_Boat_Transport_01_F": {65};
	case "B_Boat_Transport_01_F": {65};
    case "I_Heli_light_03_unarmed_F": {110};
    case "B_Heli_Light_01_armed_F": {70};
	case "O_Heli_Attack_02_black_F": {70};
	case "I_Heli_light_03_F": {70};	  
    case "B_Heli_Attack_01_F": {70};	
	case "C_Van_01_box_F": {125};
	case "I_Truck_02_transport_F": {150};
	case "I_Truck_02_covered_F": {175};		
	case "O_Truck_02_Ammo_F": {200};		
	case "B_Truck_01_mover_F": {250};		
	case "B_Truck_01_transport_F": {300};	
	case "B_Truck_01_covered_F": {350};	
	case "B_Truck_01_ammo_F": {400};	
	case "B_Truck_01_Repair_F": {450};	
	case "B_Truck_01_box_F": {600};
	case "B_APC_Tracked_01_rcws_F": {100};
	case "B_MRAP_01_hmg_F": {100};
	case "B_G_Offroad_01_armed_F": {100};
	case "O_Truck_03_device_F": {1400};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
    case "B_supplyCrate_F": {700};
	case "B_Heli_Transport_03_unarmed_F": {700};
	case "O_Heli_Transport_04_F": {100};
	case "O_Heli_Transport_04_ammo_F": {200};
	case "O_Heli_Transport_04_bench_F": {100};
	case "O_Heli_Transport_04_box_F": {200};
	case "O_Heli_Transport_04_covered_F": {200};
	case "O_Heli_Transport_04_fuel_F": {200};
	case "O_Heli_Transport_04_repair_F": {200};
	case "I_Truck_02_box_F": {500};
	case "B_G_Offroad_01_repair_F": {150};
	case "B_UGV_01_F": {420};
	case "I_SDV_01_F": {300};
	case "O_G_Offroad_01_armed_F": {75};
	default {-1};
};