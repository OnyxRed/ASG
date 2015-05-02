#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Royal Altis Police Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_CombatUniform_mcam","Cop Uniform",0];
    
    if (__GETC__(life_coplevel) == 13) then{
        _ret = [];
        _ret pushBack ["U_B_CTRG_1","British Army Uniform",0];
        if(license_baf_aircorp) then { _ret pushBack ["U_B_HeliPilotCoveralls","Heli Crew Coveralls",0]; };
        if(license_baf_armour) then { _ret pushBack ["U_B_HeliPilotCoveralls","Armour Crew Coveralls",0]; };
      
    };
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Watchcap_blk",nil,0];
		_ret pushBack ["H_Beret_blk_POLICE",nil,500];
    
    if (__GETC__(life_coplevel) == 13) then{
      _ret = [];
      _ret pushBack["H_Beret_02",nil,0];
      _ret pushBack["H_HelmetB_camo",nil,0];
      if(license_baf_aircorp) then { _ret pushBack ["H_PilotHelmetHeli_O",nil,0]; };
      if(license_baf_armour) then { _ret pushBack ["H_HelmetCrew_B",nil,0];};
	  if(license_baf_pathfinder) then {
		_ret pushBack ["H_Beret_Colonel",nil,0];
		_ret pushBack ["H_Watchcap_camo",nil,0];
	  };
    };
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
    
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,0];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["V_PlateCarrier2_rgr",nil,1500];
      
		};
		if (__GETC__(life_coplevel) > 3) then
		{
			_ret pushBack
			["V_TacVestIR_blk",nil,35000];
			_ret pushBack
			["V_PlateCarrier_Kerry",nil,35000];
      _ret pushBack
      ["V_TacVest_blk_POLICE",nil,20000];
	  _ret pushBack["V_PlateCarrierGL_blk",nil,45000];
		};
    if (__GETC__(life_coplevel) == 13) then{
      _ret  = [];
      _ret pushBack["V_PlateCarrierH_CTRG",nil,0];
	  if(license_baf_mpolice) then { _ret pushBack ["V_TacVest_blk_POLICE",nil,0]; };
    };
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Carryall_khk",nil,5000],
			["B_Carryall_oucamo",nil,17000],
			["B_Carryall_ocamo",nil,16000],
			["B_Carryall_cbr",nil,16000],
			["tf_rt1523g_black","LR Radio",1000]
		];
        if (__GETC__(life_coplevel) == 13) then{
            _ret = [];
            _ret pushBack["B_Kitbag_cbr",nil,0];
            _ret pushBack["tf_rt1523g_big","LR Radio",0];
			if (license_baf_pathfinder) then {_ret pushBack ["B_Carryall_mcamo",nil,0];};
        };
        //if (__GETC__(life_adminlevel) >= 4) then{
        //    _ret pushBack["tf_rt1523g","20KM TF Radio",0];
        //};
	};
};

_ret;