#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
      ["cop_spawn_7","Altis Police HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	  ["cop_spawn_1","Kavala Station","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
      ["cop_spawn_3","Athira Station","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
      ["cop_spawn_31","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
      ["cop_spawn_HP","Highway Patrol Outpost","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
    ];
    if (license_cop_swat) then{
      _return pushBack ["swat_hq","TFU CC","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
    };
    if (__GETC__(life_coplevel) == 12) then{
      _return = [
        ["cop_kavcp","RCC Gravia","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
        ["cop_drimcp","RCC Kavala","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
      ];
    };
    if (__GETC__(life_coplevel) == 13) then{
		_return = [
			["cop_spawn_5","HM Camp Elizabeth","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		//	["cop_spawn_6","HM Camp Victoria","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
		if (license_baf_mpolice) then{
			_return pushBack ["cop_spawn_7","Altis Police HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["cop_spawn_1","Kavala Station","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["cop_spawn_3","Athira Station","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
			_return pushBack ["cop_spawn_31","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
			_return pushBack ["cop_spawn_HP","Highway Patrol Outpost","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
		};
    };
	if((license_cop_cg)&&(__GETC__(life_coplevel) == 2))then {
		_return = _return + [
			["cop_spawn_cg","Coast Patrol HQ",nil]
		];
	};
		
	};	
	};
	
case civilian:
	{
		//if have reb license, only spawn here
		if(license_civ_rebel) then {
			_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		//	["syrta","Syrta","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		//	["zaros_spawn","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["rebel_spawn_1_1","Rebel Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["Rebelop","Rebel Camp","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]
			
			];
		};
		//if no rebel license, than can spawn normal loc
		
		if(!license_civ_rebel) then {
			_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		//	["syrta","Syrta","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		//	["zaros_spawn","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};


		
		if(__GETC__(life_donator) > 0) then {
			_return = _return + [
			["donator_spawn","Donator Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["donator_east","Donator East","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};	

		if(__GETC__(life_donator) >= 2) then {
			_return = _return + [
			["rebel_spawn_1_1","Rebel Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if (license_civ_gangbase1) then{
			_return pushBack ["gangbase1","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if (license_civ_gangbase2) then{
			_return pushBack ["gangbase2","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if (license_civ_gangbase3) then{
			_return pushBack ["gangbase3","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if (license_civ_gangbase4) then{
			_return pushBack ["gangbase4","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if (license_civ_gangbase5) then{
			_return pushBack ["gangbase5","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if (license_civ_gangbase6) then{
			_return pushBack ["gangbase6","Gang Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};
    
    if(license_civ_bh) then {
			_return = _return + [
			["bh_1","Bounty Hunter HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["bh_2","Bounty Hunter Base","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]
			];
		};
		
		//if have PMC license, only spawn here
		if(license_civ_pmc) then {
			_return = _return + [
			["pmc_1","PMC Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
	};
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;