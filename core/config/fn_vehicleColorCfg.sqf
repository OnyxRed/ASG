/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\scotpol_hb_sports.paa","cop"],
      ["textures\Police_Unmarked_HBSport.paa","cop"],
      ["textures\Civ_AbudhabiWRC_HBSport.paa","civ"],
      ["textures\Civ_MonsterWRC_HBSport.paa","civ"],
      ["textures\hatch_porche.paa","civ"],
      ["textures\Paramedic_HBsports.paa","med"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["textures\Police_Offroader.paa","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
      ["textures\Police_Hatchback.paa","cop"],
      ["textures\Civ_blackredwhite_HB.paa","civ"],
      ["textures\Civ_bluewhite_HB.paa","civ"],
      ["textures\Civ_RedBullWRC_HB.paa","civ"],
      ["textures\Civ_VWWRC_HB.paa","civ"],
      ["textures\HATO_Hatchback.paa","cop"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["textures\Police_Unmarked_SUV.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\Police_SUV.paa","cop"],
			["textures\Paramedic_SUV.paa","med"],
      ["textures\Police_ProActive_SUV.paa","cop"],
      ["textures\Civ_Black_SUV.paa","civ"],
      ["textures\Civ_blackwhite_SUV.paa","civ"],
      ["textures\Civ_bluewhite_SUV.paa","civ"],
      ["textures\Civ_bluewhiteyellow_SUV.paa","civ"],
      ["textures\Civ_dontdodrugs_SUV.paa","civ"],
      ["textures\Civ_Green_SUV.paa","civ"],
      ["textures\Civ_JurassicPark_SUV.paa","civ"],
      ["textures\Civ_northkorea_SUV.paa","civ"],
      ["textures\Civ_orangewhite_SUV.paa","civ"],
      ["textures\Civ_Red_SUV.paa","civ"],
      ["textures\Civ_redblack_SUV.paa","civ"],
      ["textures\Civ_White_SUV.paa","civ"],
      ["textures\Civ_Yellow_SUV.paa","civ"],
      ["textures\HATO_SUV.paa","cop"],
	  ["textures\BAF_MP_Police_SUV.paa","baf"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\Ambulance_Boxer_Front.paa","med","textures\Ambulance_Boxer_Back.paa"],
      ["textures\scotpol_Boxer_Cab.paa","cop","textures\scotpol_Boxer_Back.paa"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
    
	case "B_Heli_Transport_01_F":
	{
		_ret = 
		[
            ["\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext01_blufor_co.paa","baf","\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext02_blufor_co.paa"]
        ];
    };
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
            ["a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa","baf","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa"]
        ];
	};
    
    //"ARMED" Ghosthawk
    case "B_Heli_Transport_01_camo_F":
	{
		_ret = 
		[
            ["\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext01_blufor_co.paa","baf","\a3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext02_blufor_co.paa"]
        ];
    };
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["textures\police_heli.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
            ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blufor_co.paa","baf"]
		];
	};
	
    case "B_Heli_Light_01_armed_F":
	{
		_ret = 
		[
            ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blufor_co.paa","baf"]
		];
	};
	case "C_Heli_Light_01_civil_F":
	{		
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"]
		];
	};
	
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\paramedic_hems.paa","med"],
			["textures\police_orca.paa","cop"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["textures\police_hunter_front.paa","cop","textures\police_hunter_back.paa"],
            ["\a3\soft_f\MRAP_01\data\mrap_01_base_co.paa","baf","\a3\soft_f\MRAP_01\data\mrap_01_adds_co.paa"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
            ["\a3\soft_f\MRAP_01\data\mrap_01_base_co.paa","baf","\a3\soft_f\MRAP_01\data\mrap_01_adds_co.paa","\A3\Data_F\Vehicles\Turret_CO.paa"]
		];
	};
	
	case "C_Van_01_Fuel_F":
	{
		_ret =
		[
			["textures\HATO_ISU_Truck_Fuel_Cab.paa","cop","textures\HATO_ISU_Truck_Fuel_Back.paa"]
		]
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\Police_Zamac_Front.paa","cop","textures\Police_Zamac_Back.paa"]
		];
	};
	
	case "B_Truck_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","baf","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\HATO_ISU_Zamac_Cab.paa","cop","textures\HATO_ISU_Zamac_Transport.paa"]
		];
	};
	
//	case "B_APC_Wheeled_01_cannon_F":
//	{
//		_ret = 
//		[
//			//["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
//		];
//	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
  
  case "I_Heli_light_03_unarmed_F":
  {
    _ret =
    [
      ["\A3\air_f_epb\heli_light_03\data\heli_light_03_base_indp_co.paa","civ"],
      ["textures\police_india99.paa","cop"],
      ["\A3\air_f_epb\heli_light_03\data\heli_light_03_base_co.paa","baf"]
    ];
  };
  
    case "I_Heli_light_03_F":
  {
    _ret =
    [
      ["\A3\air_f_epb\heli_light_03\data\heli_light_03_base_co.paa","baf"]
    ];
  };
  
    case "B_Heli_Transport_03_unarmed_F":
  {
    _ret =
    [
      ["\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","civ","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"],
      ["\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","baf","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"]
    ];
  };
    case "B_Heli_Transport_03_F":
  {
    _ret =
    [
      ["\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","civ","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"],
      ["\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","baf","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"]
    ];
  };
  
  
  	// Ifrit
	case "O_MRAP_02_F":
	{
		_ret =
		[
			["\a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa", "civ"],
            ["\a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa", "bh"]
		];
	};
	
	// Strider
	case "I_MRAP_03_F":
	{
		_ret =
		[
			["\a3\soft_f_beta\MRAP_03\data\mrap_03_ext_co.paa", "civ"],
            ["\a3\soft_f_beta\MRAP_03\data\mrap_03_ext_co.paa", "bh"]
		];
	};
  
  case "B_G_Offroad_01_repair_F":
  {
    _ret =
    [
      ["textures\HATO_RepairOffroader.paa","cop"]
    ];
  };
  
  case "B_UGV_01_F":
  {
    _ret =
    [
      ["textures\HATO_MCU_Stomper_0.paa","cop","textures\HATO_MCU_Stomper_1.paa"]
    ];
  };
  
  case "I_Truck_02_box_F":
  {
    _ret =
    [
      ["textures\met_police_zamac_cab.paa","cop","textures\met_police_zamac_back.paa"],
	  ["textures\HATO_ISU_Zamac_Cab.paa","cop","textures\HATO_ISU_Zamac_Back.paa"],
      ["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\A3\Soft_F_Beta\Truck_02\data\truck_02_repair_indp_co.paa"]
    ];
  };
  
  case "B_G_Van_01_transport_F":
  {
    _ret =
    [
      ["textures\HATO_ISU_Truck_Flat_Cab.paa","cop","textures\HATO_ISU_Truck_Flat_Back.paa"]
    ];
  };
};

_ret;