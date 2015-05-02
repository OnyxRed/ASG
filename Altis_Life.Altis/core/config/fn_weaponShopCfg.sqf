#include <macro.h>
/*
  File: fn_weaponShopCfg.sqf
  Author: Bryan "Tonic" Boardwine
  
  Description:
  Master configuration file for the weapon shops.
  
  Return:
  String: Close the menu
  Array: 
  [Shop Name,
  [ //Array of items to add to the store
    [classname,Custom Name (set nil for default),price]
  ]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

_name = "Undefined Shop Name";
_items = [];
switch(_shop) do
{
  case "cop_basic":
  {
    switch(true) do
    {
      case (playerSide != west): {"You are not a cop!"};
      
      case (__GETC__(life_coplevel) == 13):
      {
        _name = "British Army Shop";
                    _items = [
                        ["arifle_TRG21_F",nil,0],
                        ["arifle_TRG21_GL_F",nil,500],
                        ["hgun_ACPC2_F",nil,0],
                        ["hgun_Pistol_heavy_01_F",nil,0],
                        ["SMG_02_ACO_F",nil,0],
                        ["LMG_Mk200_MRCO_F",nil,500],
                        ["srifle_EBR_MRCO_pointer_F",nil,1000],
						["srifle_DMR_06_camo_F",nil,1000],
						["srifle_DMR_03_F",nil,1000],
                        ["9Rnd_45ACP_Mag",nil,0],
                        ["11Rnd_45ACP_Mag",nil,0],
                        ["30Rnd_9x21_Mag",nil,0],
                        ["20Rnd_762x51_Mag",nil,0],
                        ["200Rnd_65x39_cased_Box",nil,0],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,0],
                        ["30Rnd_556x45_Stanag",nil,0],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,0],
                        ["optic_Holosight",nil,0],
                        ["optic_Arco",nil,0],
                        ["optic_Hamr",nil,0],
                        ["optic_MRCO",nil,0],
                        ["optic_DMS",nil,0],
						["optic_AMS",nil,0],
						["optic_KHS_base",nil,0],
                        ["acc_flashlight",nil,0],
                        ["acc_pointer_IR",nil,0],
                        ["Rangefinder",nil,0],
                        ["ItemGPS",nil,0],
                        ["ToolKit",nil,0],
                        ["NVGoggles",nil,0],
						["bipod_01_F_blk",nil,0],
						["bipod_01_F_mtp",nil,0],
						["bipod_01_F_snd",nil,0],
						["bipod_02_F_blk",nil,0],
						["bipod_02_F_hex",nil,0],
						["bipod_02_F_tan",nil,0],
						["bipod_03_F_blk",nil,0],
						["bipod_03_F_oli",nil,0]
                    ];
                    if (license_baf_mpolice) then{
                      _items pushBack ["hgun_P07_snds_F","Taser Pistol",0];
                      _items pushBack ["16Rnd_9x21_Mag","Taser Magazine",0];
                    };
					if (license_baf_pathfinder) then{
					  _items pushBack ["muzzle_snds_M",nil,0];
                      _items pushBack ["muzzle_snds_H_MG",nil,0];
					  _items pushBack ["muzzle_snds_B",nil,0];
                    };
      };
      
      case (__GETC__(life_coplevel) == 12):
      {
        _name = "HATO Shop";
          _items = [
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["B_UavTerminal",nil,0],
            ["NVGoggles",nil,0]
          ];
      };
	  
      case ((__GETC__(life_coplevel) > 7) && (__GETC__(life_coplevel) < 12)):
      {
        _name = "Royal Altis Police - Commissioner Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["arifle_TRG21_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Rubber Bullet Mag",0],
            ["arifle_MXC_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["arifle_MX_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["arifle_Mk20_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Rubber Bullet Mag",0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],
			["bipod_01_F_blk",nil,0],
			["bipod_01_F_mtp",nil,0],
			["bipod_01_F_snd",nil,0],
			["bipod_02_F_blk",nil,0],
			["bipod_02_F_hex",nil,0],
			["bipod_02_F_tan",nil,0],
			["bipod_03_F_blk",nil,0],
			["bipod_03_F_oli",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };
	  
      case ((__GETC__(life_coplevel) > 6) && (__GETC__(life_coplevel) < 12)):
      {
        _name = "Royal Altis Police - Superintendent Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["arifle_TRG21_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Rubber Bullet Mag",0],
            ["arifle_MXC_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["arifle_MX_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["arifle_Mk20_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Rubber Bullet Mag",0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],
			["bipod_01_F_blk",nil,0],
			["bipod_01_F_mtp",nil,0],
			["bipod_01_F_snd",nil,0],
			["bipod_02_F_blk",nil,0],
			["bipod_02_F_hex",nil,0],
			["bipod_02_F_tan",nil,0],
			["bipod_03_F_blk",nil,0],
			["bipod_03_F_oli",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };

      case (__GETC__(life_coplevel) == 5):
      {
        _name = "Royal Altis Police - Chief Inspector's Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["arifle_TRG21_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Rubber Bullet Mag",0],
            ["arifle_MXC_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["arifle_MX_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };

      case (__GETC__(life_coplevel) == 4):
      {
        _name = "Royal Altis Police - Inspector's Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["arifle_TRG21_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["arifle_MXC_Black_F",nil,0],
            ["30Rnd_65x39_caseless_mag",nil,0],
            ["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Rubber Bullet Mag",0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };
      
      //PC III
      case (__GETC__(life_coplevel) == 3):
      {
        _name = "Royal Altis Police - Sergeant Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["arifle_TRG21_F",nil,0],
            ["30Rnd_556x45_Stanag",nil,0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };

      case ((__GETC__(life_coplevel) == 2) || (__GETC__(life_coplevel) == 3)):
      {
        _name = "Royal Altis Police - Constable Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","Taser Magazine",0],
            //Rifles
            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
            ["SMG_02_F",nil,0],
            ["30Rnd_9x21_Mag",nil,0],
            ["SMG_01_F",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01",nil,0],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green",".45 30Rnd Vermin Rubber Bullet Mag",0],
            ["optic_Aco",nil,0],
            ["optic_Aco_grn",nil,0],
            ["optic_Holosight",nil,0],
            ["optic_Arco",nil,0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };

      case (__GETC__(life_coplevel) == 1):
      {
        _name = "Royal Altis Police - Cadet Shop";
          _items = [
            //Pistols
            ["hgun_P07_snds_F","Taser Pistol",0],
            ["16Rnd_9x21_Mag","16xTaser Rnd",0],

            ["arifle_sdar_F","Taser Rifle",0],
            ["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],

            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };

      default
      {
        _name = "Royal Altis Police - Equipment Shop";
          _items = [
            //Equipment
            ["ToolKit",nil,0],
            ["Medikit",nil,0],
            ["FirstAidKit",nil,0],
            ["Binocular",nil,0],
            ["ItemGPS",nil,0],
            ["ItemCompass",nil,0],
            ["ItemWatch",nil,0],
            ["ItemMap",nil,0],
            ["ItemRadio",nil,0],
            ["NVGoggles",nil,0]
          ];
      };
    };
  };
  
  case "cop_equipment":
  {
    switch(true) do
    {
      case (playerSide != west): {"You are not a cop!"};
      case (__GETC__(life_coplevel) == 13):
      {
            _name = "British Army - Equipment Shop";
            _items = [
			  ["tf_anprc152","5KM TF Radio",0],
              ["Binocular",nil,0],
              ["ItemGPS",nil,0],
              ["ToolKit",nil,0],
              ["FirstAidKit",nil,0],
              ["NVGoggles",nil,0],
              ["Chemlight_green",nil,0],
              ["Chemlight_red",nil,0],
              ["SmokeShell",nil,0],
              ["SmokeShellRed",nil,0],
              ["SmokeShellGreen",nil,0],
              ["1Rnd_Smoke_Grenade_shell",nil,0],
              ["1Rnd_SmokeRed_Grenade_shell",nil,0],
              ["1Rnd_SmokeGreen_Grenade_shell",nil,0],
              ["UGL_FlareGreen_F",nil,0],
              ["UGL_FlareRed_F",nil,0],
              ["UGL_FlareYellow_F",nil,0]
            ];
			if(license_baf_cmedic) then { _items pushBack ["Medikit",nil,0]; };
      };
      case (__GETC__(life_coplevel) < 12): 
      {
          _name = "Royal Altis Police - Equipment Shop";
            _items = [
              ["Binocular",nil,0],
              ["ItemGPS",nil,0],
              ["ToolKit",nil,0],
              ["muzzle_snds_L",nil,0],
              ["FirstAidKit",nil,0],
              ["Medikit",nil,0],
              ["NVGoggles",nil,0],
              ["ItemRadio","Cell Phone",0],
              ["tf_anprc152","5KM TF Radio",0]
            ];
      };
    };
  };

  
  case "donator_equipment":
  {
    switch(true) do
    {
      case (__GETC__(life_donator) == 0): {"Visit www.AltisLifeRP.co.uk to donate!"};
      
      case (__GETC__(life_donator) == 1):
      {
        _name = "Level 1 Donator";
          _items = [
            ["Binocular",nil,150],
            ["ItemGPS",nil,100],
            ["ToolKit",nil,250],
            ["FirstAidKit",nil,150],
            ["NVGoggles",nil,1000],
            ["Rangefinder",nil,1000],
            ["hgun_Pistol_Signal_F","Flare Gun",1000],
            ["6Rnd_RedSignal_F","Red Flare",1000]
          ];
      };
    };
  };
  
  case "swat_basic":
  {
    switch(true) do
    {
      case (playerSide != west): {"You are not a cop!"};
      case (!(license_cop_swat)): {"You're not a member of TFU!"};
      case (license_cop_swat):
      {
        _name = "Tactical Firearms Unit Shop";
        _items = [
          ["srifle_EBR_F",nil,0],
		  ["srifle_DMR_06_camo_F",nil,0],
		  ["srifle_DMR_03_F",nil,0],
          ["20Rnd_762x51_Mag",nil,0],
		  ["srifle_DMR_01_DMS_F",nil,0],
		  ["10Rnd_762x54_Mag",nil,0],
          ["arifle_MX_GL_F",nil,0],
          ["arifle_MX_GL_Black_F",nil,0],
          ["arifle_MX_F",nil,0],
          ["arifle_MX_Black_F",nil,0],
          ["arifle_MXC_F",nil,0],
          ["arifle_MXC_Black_F",nil,0],
          ["arifle_MXM_F",nil,0],
          ["arifle_MXM_Black_F",nil,0],
          ["30Rnd_65x39_caseless_mag",nil,0],
          ["arifle_MX_SW_F",nil,0],
          ["100Rnd_65x39_caseless_mag",nil,0],
          ["arifle_TRG21_F",nil,0],
          ["arifle_TRG21_GL_F",nil,0],
          ["30Rnd_556x45_Stanag",nil,0],
          ["arifle_Mk20_F",nil,0],
          ["30Rnd_556x45_Stanag",nil,0],
          ["1Rnd_HE_Grenade_shell",nil,0],
          ["1Rnd_Smoke_Grenade_shell",nil,0],
          ["5Rnd_127x108_APDS_Mag",nil,0],
          ["hgun_Pistol_heavy_01_F",nil,0],
          ["11Rnd_45ACP_Mag",nil,0],
          ["hgun_ACPC2_F",nil,0],
          ["9Rnd_45ACP_Mag",nil,0],
          ["optic_Hamr",nil,0],
          ["optic_Aco",nil,0],
          ["optic_Arco",nil,0],
          ["optic_Holosight",nil,0],
          ["optic_MRCO",nil,0],
          ["optic_DMS",nil,0],
		  ["optic_AMS",nil,0],
		  ["optic_KHS_base",nil,0],
          ["optic_tws",nil,0],
          ["acc_flashlight",nil,0],
          ["acc_pointer_IR",nil,0],
		  ["bipod_01_F_blk",nil,0],
		  ["bipod_01_F_mtp",nil,0],
		  ["bipod_01_F_snd",nil,0],
		  ["bipod_02_F_blk",nil,0],
		  ["bipod_02_F_hex",nil,0],
		  ["bipod_02_F_tan",nil,0],
		  ["bipod_03_F_blk",nil,0],
		  ["bipod_03_F_oli",nil,0]
        ];
		if (__GETC__(life_coplevel) == 11) then { _items pushBack ["srifle_LRR_F","M320 LRR",1300000]; _items pushBack ["7Rnd_408_Mag","LRR Rounds",10000]; };
      };
    };
  };
  
  case "donator_basic":
  {
    switch(true) do
    {
    case (__GETC__(life_donator) == 0): {"Visit www.AltisLifeRP.co.uk to donate!"};
    case (__GETC__(life_donator) == 1):
      {
        _name = "ArmyStormGaming Donator Shop";
        _items = [                    
        ["arifle_Mk20_F","MK20 5.56mm",70000],
        ["arifle_TRG20_F","MK20 GL 5.56mm",70000],
        ["arifle_Katiba_F","Katiba 6.5mm",68000],
        ["srifle_DMR_01_F",nil,120000],
		["srifle_DMR_06_camo_F",nil,300000],
		["srifle_DMR_03_F",nil,850000],
		["20Rnd_762x51_Mag",nil,500],
        ["arifle_Katiba_ARCO_pointer_F","Katiba ARCO 6.5mm",71000],
        ["arifle_Katiba_GL_F","Katiba GL 6.5mm",74000],
        ["arifle_Katiba_GL_ARCO_pointer_F","Katiba GL ARCO 6.5mm",77000],
        ["arifle_MXM_RCO_pointer_snds_F",nil,160000],
        ["LMG_Mk200_F",nil,98000],
        ["LMG_Zafir_F",nil,90000],
        ["LMG_Mk200_F",nil,85000],
        ["arifle_SDAR_F",nil,45000],
        ["optic_ACO_grn",nil,7500],
        ["optic_Holosight",nil,9600],
        ["acc_flashlight",nil,10000],
        ["acc_pointer_IR",nil,10000],
        ["optic_ACO_grn",nil,7000],
        ["optic_Holosight",nil,12600],
        ["optic_Hamr",nil,20000],
        ["optic_Arco",nil,65000],
		["optic_AMS",nil,50000],
		["optic_KHS_base",nil,50000],
        ["optic_DMS",nil,65000],
        ["optic_LRPS",nil,95000],
        ["optic_NVS",nil,150000],
        ["muzzle_snds_H",nil,15000],
        ["muzzle_snds_B",nil,15000],
        ["muzzle_snds_M",nil,15000],
        ["5Rnd_127x108_Mag",nil,14000],
        ["7Rnd_408_Mag",nil,14000],
        ["30Rnd_9x21_Mag",nil,200],
        ["9Rnd_45ACP_Mag",nil,300],
        ["20Rnd_556x45_UW_mag",nil,125],
        ["30Rnd_556x45_Stanag",nil,300],
        ["10Rnd_762x51_Mag",nil,500],
        ["20Rnd_762x51_Mag",nil,500],
        ["30Rnd_65x39_caseless_green",nil,275],
        ["150Rnd_762x51_Box",nil,300],
        ["100Rnd_65x39_caseless_mag_Tracer",nil,600],
        ["100Rnd_65x39_caseless_mag",nil,1100],  
        ["200Rnd_65x39_cased_Box",nil,1000],
        ["30Rnd_65x39_caseless_mag",nil,150],
        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
        ["RPG32_F",nil,100000],
        ["Rangefinder",nil,10000],
        ["1Rnd_SmokeRed_Grenade_shell",nil,15000],
        ["1Rnd_SmokeGreen_Grenade_shell",nil,15000],
        ["1Rnd_SmokeYellow_Grenade_shell",nil,15000],
        ["1Rnd_SmokePurple_Grenade_shell",nil,15000],
        ["1Rnd_SmokeBlue_Grenade_shell",nil,15000],
        ["1Rnd_SmokeOrange_Grenade_shell",nil,15000],
        ["SmokeShellYellow",nil,11000],
        ["SmokeShellGreen",nil,11000],
        ["SmokeShellRed",nil,11000],
        ["SmokeShellPurple",nil,11000],
        ["SmokeShellOrange",nil,11000],
        ["SmokeShellBlue",nil,11000]

        ];
      };

    case (__GETC__(life_donator) == 2):
      {
        _name = "ArmyStormGaming Donator Shop";
        _items = [                    
        ["arifle_Mk20_F","MK20 5.56mm",60000],
        ["arifle_TRG20_F","MK20 GL 5.56mm",60000],
        ["arifle_Katiba_F","Katiba 6.5mm",62000],
        ["srifle_DMR_01_F",nil,115000],
		["srifle_DMR_06_camo_F",nil,300000],
		["srifle_DMR_03_F",nil,750000],
		["20Rnd_762x51_Mag",nil,500],
        ["arifle_Katiba_ARCO_pointer_F","Katiba ARCO 6.5mm",70000],
        ["arifle_Katiba_GL_F","Katiba GL 6.5mm",72000],
        ["arifle_Katiba_GL_ARCO_pointer_F","Katiba GL ARCO 6.5mm",75000],
        ["arifle_MXM_RCO_pointer_snds_F",nil,150000],
        ["LMG_Mk200_F",nil,95000],
        ["LMG_Zafir_F",nil,87000],
        ["LMG_Mk200_F",nil,82000],
        ["arifle_SDAR_F",nil,43500],
        ["optic_ACO_grn",nil,6500],
        ["optic_Holosight",nil,8600],
        ["acc_flashlight",nil,9000],
        ["acc_pointer_IR",nil,9000],
        ["optic_ACO_grn",nil,8000],
        ["optic_Holosight",nil,11500],
        ["optic_Arco",nil,18000],
        ["optic_Hamr",nil,18000],
		["optic_AMS",nil,50000],
		["optic_KHS_base",nil,50000],
        ["optic_DMS",nil,62000],
        ["optic_LRPS",nil,92000],
        ["optic_NVS",nil,145000],
        ["muzzle_snds_H",nil,12000],
        ["muzzle_snds_B",nil,12000],
        ["muzzle_snds_M",nil,12000],
        ["5Rnd_127x108_Mag",nil,1000],
        ["7Rnd_408_Mag",nil,13000],
        ["30Rnd_9x21_Mag",nil,200],
        ["9Rnd_45ACP_Mag",nil,300],
        ["20Rnd_556x45_UW_mag",nil,125],
        ["30Rnd_556x45_Stanag",nil,300],
        ["10Rnd_762x51_Mag",nil,500],
        ["20Rnd_762x51_Mag",nil,500],
        ["30Rnd_65x39_caseless_green",nil,275],
        ["150Rnd_762x51_Box",nil,300],
        ["100Rnd_65x39_caseless_mag_Tracer",nil,600],
        ["100Rnd_65x39_caseless_mag",nil,1100],  
        ["200Rnd_65x39_cased_Box",nil,1000],
        ["30Rnd_65x39_caseless_mag",nil,150],
        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
        ["RPG32_F",nil,90000],
        ["Rangefinder",nil,9000],
        ["1Rnd_SmokeRed_Grenade_shell",nil,13000],
        ["1Rnd_SmokeGreen_Grenade_shell",nil,13000],
        ["1Rnd_SmokeYellow_Grenade_shell",nil,13000],
        ["1Rnd_SmokePurple_Grenade_shell",nil,13000],
        ["1Rnd_SmokeBlue_Grenade_shell",nil,13000],
        ["1Rnd_SmokeOrange_Grenade_shell",nil,13000],
        ["SmokeShellYellow",nil,10000],
        ["SmokeShellGreen",nil,10000],
        ["SmokeShellRed",nil,10000],
        ["SmokeShellPurple",nil,10000],
        ["SmokeShellOrange",nil,10000],
        ["SmokeShellBlue",nil,10000],
        ["SmokeShellYellow",nil,10000],
        ["SmokeShellGreen",nil,10000],
        ["SmokeShellRed",nil,10000],
        ["SmokeShellPurple",nil,10000],
        ["SmokeShellOrange",nil,10000],
        ["SmokeShellBlue",nil,10000]

        ];
      };
      
    case (__GETC__(life_donator) == 3):
      {
        _name = "ArmyStormGaming Donator Shop";
        _items = [                    
        ["arifle_Mk20_F","MK20 5.56mm",55000],
        ["arifle_Mk20_GL_F","MK20 GL 5.56mm",65000],
        ["arifle_TRG20_F",nil,55000],
        ["arifle_Katiba_F","Katiba 6.5mm",60000],
        ["arifle_Katiba_ARCO_pointer_F","Katiba ARCO 6.5mm",68000],
        ["arifle_Katiba_GL_F","Katiba GL 6.5mm",70000],
        ["arifle_Katiba_GL_ARCO_pointer_F","Katiba GL ARCO 6.5mm",73000],
        ["srifle_DMR_01_F",nil,110000],
		["srifle_DMR_06_camo_F",nil,300000],
		["srifle_DMR_03_F",nil,700000],
		["20Rnd_762x51_Mag",nil,500],
        ["arifle_MXM_RCO_pointer_snds_F",nil,143000],
        ["LMG_Zafir_F",nil,85000],
        ["LMG_Mk200_F",nil,80000],
        ["arifle_SDAR_F",nil,40000],
        ["SMG_01_F",nil,8000],
        ["30Rnd_45ACP_Mag_SMG_01",nil,300],
        ["acc_flashlight",nil,8000],
        ["acc_pointer_IR",nil,8000],
        ["optic_ACO_grn",nil,7000],
        ["optic_Holosight",nil,10500],
        ["optic_Arco",nil,15000],
        ["optic_Hamr",nil,15000],
		["optic_AMS",nil,50000],
		["optic_KHS_base",nil,50000],
        ["optic_DMS",nil,60000],
        ["optic_LRPS",nil,90000],
        ["optic_NVS",nil,140000],
        ["muzzle_snds_H",nil,10000],
        ["muzzle_snds_B",nil,10000],
        ["muzzle_snds_M",nil,10000],
        ["5Rnd_127x108_Mag",nil,1000],
        ["7Rnd_408_Mag",nil,12000],
        ["30Rnd_9x21_Mag",nil,200],
        ["9Rnd_45ACP_Mag",nil,300],
        ["20Rnd_556x45_UW_mag",nil,125],
        ["30Rnd_556x45_Stanag",nil,300],
        ["10Rnd_762x51_Mag",nil,500],
        ["20Rnd_762x51_Mag",nil,500],
        ["30Rnd_65x39_caseless_green",nil,275],
        ["150Rnd_762x51_Box",nil,300],
        ["100Rnd_65x39_caseless_mag_Tracer",nil,600],
        ["100Rnd_65x39_caseless_mag",nil,1100],  
        ["200Rnd_65x39_cased_Box",nil,1000],
        ["30Rnd_65x39_caseless_mag",nil,150],
        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
        ["RPG32_F",nil,80000],
        ["Rangefinder",nil,7000],
        ["1Rnd_SmokeRed_Grenade_shell",nil,11000],
        ["1Rnd_SmokeGreen_Grenade_shell",nil,11000],
        ["1Rnd_SmokeYellow_Grenade_shell",nil,11000],
        ["1Rnd_SmokePurple_Grenade_shell",nil,11000],
        ["1Rnd_SmokeBlue_Grenade_shell",nil,11000],
        ["1Rnd_SmokeOrange_Grenade_shell",nil,11000],
        ["SmokeShellYellow",nil,9000],
        ["SmokeShellGreen",nil,9000],
        ["SmokeShellRed",nil,9000],
        ["SmokeShellPurple",nil,9000],
        ["SmokeShellOrange",nil,9000],
        ["SmokeShellBlue",nil,9000]
        ];
      };
    };
  };
  
  case "med_basic":
  {
    switch (true) do 
    {
      case (playerSide != independent): {"You are not an EMS Medic"};
      default {
        _name = "Hospital EMS Shop";
          _items = [
            ["U_B_CombatUniform_mcam","Medic Uniform",0],
            ["ItemGPS",nil,0],
            ["ItemRadio","Cell Phone",0],
            ["Binocular",nil,0],
            ["ToolKit",nil,0],
            ["FirstAidKit",nil,0],
            ["Medikit",nil,0],
            ["NVGoggles",nil,0],
            ["B_FieldPack_ocamo",nil,0]
          ];
      };
    };
  };

  case "rebel_equipment":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      case (!license_civ_rebel): {"You don't have a Rebel training license!"};
      default
      {
        _name = "Mohammed's Equipment";
          _items = [
            ["Binocular",nil,550],
            ["ItemGPS",nil,500],
            ["ItemRadio","Cell Phone",500],
            ["ToolKit",nil,850],
            ["FirstAidKit",nil,550],
            ["NVGoggles",nil,10000],
            ["Rangefinder",nil,10000],
            ["hgun_Pistol_Signal_F","Flare Gun",5000],
            ["6Rnd_RedSignal_F","Red Flare",1500],
            ["muzzle_snds_L",nil,17000],
            ["muzzle_snds_M",nil,17000],
            ["muzzle_snds_H_MG",nil,17000],
            ["optic_Arco",nil,17000],
            ["optic_Hamr",nil,17000],
            ["optic_Aco",nil,5200],
            ["optic_SOS",nil,22000],
            ["optic_DMS",nil,20000]
          ];
      };
    };
  };
  
  case "rebel":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      case (!license_civ_rebel): {"You don't have a Rebel training license!"};
      default
      {
        _name = "Mohammed's Jihadi Shop";
          _items = [
            ["arifle_Mk20_F",nil,80000],
            ["arifle_TRG20_F",nil,76000],
            ["arifle_Katiba_F",nil,72000],
            ["arifle_Katiba_ARCO_pointer_F",nil,75000],
            ["arifle_Katiba_GL_F",nil,77000],
            ["arifle_Katiba_GL_ARCO_pointer_F",nil,80000],
            ["srifle_DMR_01_F",nil,150000],
			["srifle_DMR_06_camo_F",nil,700000],
			["20Rnd_762x51_Mag",nil,500],
			["srifle_DMR_03_F",nil,890000],
			["srifle_DMR_02_F",nil,1200000],
			["10Rnd_338_Mag",nil,500],
            ["arifle_MX_GL_F",nil,85000],
            ["arifle_MX_SW_F",nil,90000],
            ["arifle_SDAR_F",nil,50000],
            ["arifle_MX_GL_ACO_pointer_F",nil,94000],
            ["LMG_Mk200_F",nil,105000],
            ["optic_ACO_grn",nil,9000],
            ["optic_Holosight",nil,10000],
            ["acc_flashlight",nil,12000],
            ["acc_pointer_IR",nil,12000],
            ["acc_pointer_IR",nil,8000],
            ["optic_Arco",nil,22000],
            ["optic_Hamr",nil,22000],
			["optic_AMS",nil,55000],
			["optic_KHS_base",nil,55000],
            ["optic_DMS",nil,68000],
            ["optic_LRPS",nil,99000],
            ["optic_NVS",nil,151000],
            ["UGL_FlareWhite_F",nil,20000],
            ["UGL_FlareGreen_F",nil,20000],
            ["UGL_FlareRed_F",nil,20000],
            ["UGL_FlareYellow_F",nil,20000],
            ["UGL_FlareCIR_F",nil,15000],
            ["1Rnd_SmokeRed_Grenade_shell",nil,17000],
            ["1Rnd_SmokeGreen_Grenade_shell",nil,17000],
            ["1Rnd_SmokeYellow_Grenade_shell",nil,17000],
            ["1Rnd_SmokePurple_Grenade_shell",nil,17000],
            ["1Rnd_SmokeBlue_Grenade_shell",nil,17000],
            ["1Rnd_SmokeOrange_Grenade_shell",nil,17000],
            ["SmokeShellYellow",nil,12000],
            ["SmokeShellGreen",nil,12000],
            ["SmokeShellRed",nil,12000],
            ["SmokeShellPurple",nil,12000],
            ["SmokeShellOrange",nil,12000],
            ["SmokeShellBlue",nil,12000],
            ["100Rnd_65x39_caseless_mag_Tracer",nil,500],
            ["100Rnd_65x39_caseless_mag",nil,500],
            ["30Rnd_65x39_caseless_mag",nil,300],
            ["30Rnd_65x39_caseless_mag_Tracer",nil,300],
            ["200Rnd_65x39_cased_Box",nil,1000],
            ["optic_Arco",nil,20000],
            ["optic_Hamr",nil,20000],
            ["hgun_Pistol_heavy_01_MRD_F",nil,5000],
            ["11Rnd_45ACP_Mag",nil,500],
            ["5Rnd_127x108_Mag",nil,500],
            ["SMG_01_F",nil,11000],
            ["30Rnd_45ACP_Mag_SMG_01",nil,300],
            ["7Rnd_408_Mag",nil,15000],
            ["muzzle_snds_H",nil,17000],
            ["muzzle_snds_B",nil,17000],
            ["muzzle_snds_M",nil,17000],
            ["30Rnd_9x21_Mag",nil,200],
            ["20Rnd_556x45_UW_mag",nil,125],
            ["30Rnd_556x45_Stanag",nil,300],
            ["10Rnd_762x51_Mag",nil,500],
            ["30Rnd_65x39_caseless_green",nil,275],
            ["150Rnd_762x51_Box",nil,300],
            ["RPG32_F",nil,150000],
            ["Rangefinder",nil,15000],
			["bipod_01_F_blk",nil,26000],
			["bipod_01_F_mtp",nil,26000],
			["bipod_01_F_snd",nil,26000],
			["bipod_02_F_blk",nil,26000],
			["bipod_02_F_hex",nil,26000],
			["bipod_02_F_tan",nil,26000],
			["bipod_03_F_blk",nil,26000],
			["bipod_03_F_oli",nil,26000],
            ["V_HarnessOGL_gry","Suicide Vest",10000000]
          ];
      };
    };
  };
  
  case "gun":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      case (!license_civ_gun): {"You don't have a Firearms license!"};
      default
      {
        _name = "Billy Joe's Firearms";
          _items = [
            ["hgun_Rook40_F",nil,5000],
            ["hgun_Pistol_heavy_02_F",nil,9500],
            ["hgun_ACPC2_F",nil,7000],
            ["optic_ACO_grn_smg",nil,5000],
            ["V_Rangemaster_belt",nil,5900],
            ["16Rnd_9x21_Mag",nil,500],
            ["9Rnd_45ACP_Mag",nil,750],
            ["6Rnd_45ACP_Cylinder",nil,600],
            ["30Rnd_9x21_Mag",nil,900]
          ];
      };
    };
  };
  
  case "gun_range":
  {
    switch(true) do
    {
      default
      {
        _name = "Firing Range Ammo";
          _items = [
            ["16Rnd_9x21_Mag",nil,500],
            ["9Rnd_45ACP_Mag",nil,750],
            ["6Rnd_45ACP_Cylinder",nil,600],
            ["30Rnd_9x21_Mag",nil,900]
          ];
      };
    };
  };
  
  case "fireworks": 
  {
    _name = "Fireworks";
      _items = [
        ["hgun_Pistol_Signal_F","Firework Launcher",3500],
        ["6Rnd_RedSignal_F","Red Rocket",25],
        ["6Rnd_GreenSignal_F","Green Rocket",25]
      ];
  };
  
  case "pmc_weapons":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      default
      {
        _name = "PMC Armoury";
          _items = [
            ["Binocular",nil,150],
            ["ItemGPS",nil,100],
            ["ToolKit",nil,7000],
            ["FirstAidKit",nil,1500],
            ["Medikit",nil,1000],
            ["NVGoggles",nil,2000],
            ["SMG_02_ACO_F",nil,10000],
            ["hgun_ACPC2_F",nil,3500],
            ["arifle_TRG20_F",nil,75000],
            ["arifle_Katiba_F",nil,70000],
            ["arifle_Katiba_C_F",nil,75000],
            ["arifle_Katiba_GL_F",nil,78000],
            ["arifle_SDAR_F",nil,49500],
            ["arifle_Mk20_F",nil,78000],
            ["arifle_Mk20_GL_F",nil,83000],
            ["arifle_Mk20C_F",nil,85000],
            ["arifle_MXC_F",nil,95000],
            ["arifle_MX_GL_ACO_pointer_F",nil,99000],
            ["arifle_MX_F",nil,100000],
            ["arifle_MXM_F",nil,87000],
            ["LMG_Mk200_F",nil,102000],
            ["SMG_01_F",nil,10000],
            ["30Rnd_45ACP_Mag_SMG_01",nil,300],
            ["9Rnd_45ACP_Mag",nil,200],
            ["30Rnd_9x21_Mag",nil,200],
            ["20Rnd_556x45_UW_mag",nil,125],
            ["30Rnd_65x39_caseless_mag",nil,100],
            ["10Rnd_762x51_Mag",nil,500],
            ["30Rnd_65x39_caseless_green",nil,275],
            ["30Rnd_556x45_Stanag_Tracer_Green",nil,275],
            ["30Rnd_65x39_caseless_mag_Tracer",nil,275],
            ["30Rnd_556x45_Stanag",nil,275],
            ["100Rnd_65x39_caseless_mag",nil,1000],  
            ["hgun_Pistol_heavy_01_MRD_F",nil,5000],
            ["11Rnd_45ACP_Mag",nil,500],
            ["200Rnd_65x39_cased_Box",nil,1000],
            ["muzzle_snds_acp",nil,15000],
            ["muzzle_snds_L",nil,15000],
            ["muzzle_snds_M",nil,15000],
            ["muzzle_snds_H",nil,15000],
            ["muzzle_snds_H_MG",nil,19000],
            ["optic_ACO_grn",nil,9000],
            ["optic_Holosight",nil,9600],
            ["optic_MRCO",nil,8000],
            ["optic_Arco",nil,6000],
            ["optic_Hamr",nil,9000],
            ["acc_flashlight",nil,1000],
            ["Rangefinder",nil,5000]
          ];
      };
    };
  };
  
  case "gang":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      default
      {
        _name = "Hideout Armament";
          _items = [
            ["Binocular",nil,350],
            ["ItemGPS",nil,300],
            ["ToolKit",nil,5000],
            ["FirstAidKit",nil,1000],
            ["Medikit",nil,1000],
            ["NVGoggles",nil,2000],
            ["SMG_02_ACO_F",nil,9000],
            ["hgun_ACPC2_F",nil,3500],
            ["arifle_TRG20_F",nil,75000],
            ["arifle_Katiba_F",nil,70000],
            ["arifle_Katiba_C_F",nil,75000],
            ["arifle_Katiba_GL_F",nil,78000],
            ["arifle_SDAR_F",nil,49500],
            ["arifle_Mk20_F",nil,78000],
            ["arifle_Mk20_GL_F",nil,83000],
            ["arifle_Mk20C_F",nil,85000],
            ["arifle_MXC_F",nil,95000],
            ["arifle_MX_GL_ACO_pointer_F",nil,99000],
            ["arifle_MX_F",nil,100000],
            ["arifle_MXM_F",nil,87000],
            ["LMG_Mk200_F",nil,102000],
            ["SMG_01_F",nil,10000],
            ["30Rnd_45ACP_Mag_SMG_01",nil,300],
            ["9Rnd_45ACP_Mag",nil,200],
            ["30Rnd_9x21_Mag",nil,200],
            ["20Rnd_556x45_UW_mag",nil,125],
            ["30Rnd_65x39_caseless_mag",nil,100],
            ["10Rnd_762x51_Mag",nil,500],
            ["30Rnd_65x39_caseless_green",nil,275],
            ["30Rnd_556x45_Stanag_Tracer_Green",nil,275],
            ["30Rnd_65x39_caseless_mag_Tracer",nil,275],
            ["30Rnd_556x45_Stanag",nil,275],
            ["100Rnd_65x39_caseless_mag",nil,1000],  
            ["hgun_Pistol_heavy_01_MRD_F",nil,5000],
            ["11Rnd_45ACP_Mag",nil,500],
            ["200Rnd_65x39_cased_Box",nil,1000],
            ["muzzle_snds_acp",nil,15000],
            ["muzzle_snds_L",nil,15000],
            ["muzzle_snds_M",nil,15000],
            ["muzzle_snds_H",nil,15000],
            ["muzzle_snds_H_MG",nil,19000],
            ["optic_ACO_grn",nil,9000],
            ["optic_Holosight",nil,9600],
            ["optic_MRCO",nil,8000],
            ["optic_Arco",nil,6000],
            ["optic_Hamr",nil,9000],
            ["acc_flashlight",nil,1000],
            ["Rangefinder",nil,5000]
          ];
      };
    };
  };
  
  case "genstore":
  {
    _name = "Altis General Store";
      _items = [
        ["Binocular",nil,150],
        ["ItemGPS",nil,100],
        ["ItemRadio","Cell Phone",500],
        ["ToolKit",nil,3500],
        ["FirstAidKit",nil,150],
        ["NVGoggles",nil,2000],
        ["Chemlight_red",nil,300],
        ["Chemlight_yellow",nil,300],
        ["Chemlight_green",nil,300],
        ["Chemlight_blue",nil,300]
      ];
  };
  
  case "bh":
  {
    _name = "Bounty Hunter Shop";
      _items = [
        ["Binocular",nil,150],
        ["Rangefinder",nil,10000],
        ["ItemGPS",nil,100],
        ["ItemRadio","Cell Phone",500],
        ["tf_anprc152","5KM TF Radio",0],
        ["ToolKit",nil,250],
        ["FirstAidKit",nil,150],
        ["NVGoggles_INDEP",nil,2000],
        ["arifle_MXC_F",nil,10000],
        ["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
        ["30Rnd_65x39_caseless_mag",nil,1000],
        ["arifle_sdar_F","Tazer Rifle",15000],
        ["20Rnd_556x45_UW_mag","Tazer Rifle Rounds",250],
        ["hgun_P07_snds_F","Tazer Pistol",5000],
        ["16Rnd_9x21_Mag","Tazer Pistol Rounds",100],
        ["muzzle_snds_H",nil,15000],
        ["acc_flashlight","Fishlight",1000],
        ["optic_ACO_grn",nil,500],
        ["optic_Aco",nil,500],
        ["optic_Holosight",nil,5000],
        ["optic_tws_mg","TWS MG",600000],
		["optic_MRCO",nil,15000],
        ["optic_Arco",nil,22000],
		["optic_Hamr",nil,22000],
		["optic_AMS",nil,50000],
		["optic_KHS_base",nil,50000],
        ["optic_DMS",nil,68000],
        ["optic_LRPS",nil,99000],
    //    ["optic_tws","TWS",650000],
    //    ["optic_Nightstalker","Nightstalker",1100000],
        ["optic_NVS","NVS",150000],
        ["srifle_EBR_F","MK18 ABR",950000],
		["srifle_DMR_03_F",nil,950000],
		["20Rnd_762x51_Mag",nil,500],
		["srifle_DMR_06_camo_F",nil,950000],
    //    ["srifle_GM6_F","GM6 Lynx",1200000],
    //    ["5Rnd_127x108_Mag","GM6 Rounds",12000],
    //    ["5Rnd_127x108_APDS_Mag","GM6 AP Rounds",15000],
        ["srifle_LRR_F","M320 LRR",1550000],
        ["7Rnd_408_Mag","LRR Rounds",15000],
        ["SmokeShell",nil,10000],
        ["Chemlight_green",nil,300],
        ["Chemlight_red",nil,300],
        ["Chemlight_yellow",nil,300],
        ["Chemlight_blue",nil,300]
      ];
  };
  
  case "BMweapons":    //Request from The Puppeteer
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      default
      {
        _name = "Black Market Gear";
          _items = [
            ["NVGoggles","Brown NV Goggles",5000],
            ["NVGoggles_OPFOR","Black NV Goggles",5000],
            ["NVGoggles_INDEP","Green NV Goggles",5000],
            ["optic_tws_mg","TWS MG",875000],
        //    ["optic_tws","TWS",650000],
        //    ["optic_Nightstalker","Nightstalker",1100000],
            ["optic_NVS","NVS",150000],
            ["srifle_EBR_F","MK18 ABR",950000],
			["srifle_DMR_03_F",nil,950000],
			["20Rnd_762x51_Mag",nil,500],
			["srifle_DMR_06_camo_F",nil,950000],
			["srifle_DMR_02_F",nil,1300000],
			["10Rnd_338_Mag",nil,1000],
        //    ["srifle_GM6_F","GM6 Lynx",1200000],
        //    ["5Rnd_127x108_Mag","GM6 Rounds",12000],
        //    ["5Rnd_127x108_APDS_Mag","GM6 AP Rounds",15000],
            ["srifle_LRR_F","M320 LRR",1650000],
            ["7Rnd_408_Mag","LRR Rounds",15000]
          ];
      };
    };
  };
  
  case "c3":
  {
    switch(true) do
    {
      case (playerSide != civilian): {"You are not a civilian!"};
      case (!license_civ_c3): {"You don't have a class three license!"};
      default
      {
        _name = "Class 3 Weaponry";
          _items = [
            ["Binocular",nil,150],
            ["Rangefinder",nil,10000],
            ["ToolKit",nil,250],
            ["FirstAidKit",nil,150],
            ["NVGoggles_INDEP",nil,2000],
            ["arifle_TRG21_F",nil,40000],
            ["arifle_TRG20_F",nil,45000],
            ["arifle_Mk20_plain_F",nil,40000],
            ["arifle_Mk20C_plain_F",nil,45000],
            ["arifle_SDAR_F",nil,25000],
            ["hgun_Pistol_heavy_01_F",nil,13000],
            ["hgun_Pistol_heavy_02_F",nil,10000],
            ["optic_MRD",nil,5000],
            ["optic_Yorris",nil,5000],
            ["optic_Hamr",nil,7500],
            ["optic_Arco",nil,7500],
            ["optic_MRCO",nil,10000],
            ["optic_ACO_grn",nil,3500],
            ["optic_Aco",nil,3500],
            ["optic_Holosight",nil,3500],
            ["acc_flashlight",nil,750],
            ["30Rnd_556x45_Stanag",nil,250],
            ["20Rnd_556x45_UW_mag",nil,150],
            ["9Rnd_45ACP_Mag",nil,100],
            ["11Rnd_45ACP_Mag",nil,100],
            ["6Rnd_45ACP_Cylinder",nil,100]
            
          ];
      };
    };
  };
};

/* Admin items to show in all shops of this type */
if (__GETC__(life_adminlevel) >= 4) then{
    if (_name == "Undefined Shop Name") then{_name = "Admin Override Shop";};
    _items pushBack ["tf_anprc152","5KM TF Radio",0];
};

diag_log "Number of items in shop array:";
diag_log count _items;

/* Do not return array if no items (This should fix "You are not a cop" etc */
if (count _items > 0) then{
[_name,_items];
};