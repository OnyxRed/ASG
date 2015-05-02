#include <macro.h>
/*
	File: fn_changeArmyGear.sqf
	Author: Jaffa
	
	Description:
	Changes army gear when entering and exit base camps.
*/
private["_action"];
_action = [_this,0,"leave_base",[""]] call BIS_fnc_param;
if (__GETC__(life_coplevel) != 13) exitWith {};

switch (_action) do {
	case "leave_base": {
		if (((goggles player) != "G_Combat") && ((goggles player) != "")) then { profileNamespace setVariable["life_army_noncombat_goggles",(goggles player)]; };
		if !((headGear player) in ["H_HelmetCrew_B","H_PilotHelmetHeli_O"]) then {player addHeadgear "H_HelmetB_camo";};
		player addGoggles "G_Combat";
		player assignItem "NVGoggles";
		systemChat "Switched to operations gear";
	};
	case "enter_base": {
		if (((goggles player) != "G_Combat") && ((goggles player) != "")) then { profileNamespace setVariable["life_army_noncombat_goggles",(goggles player)]; };
		if !((headGear player) in ["H_HelmetCrew_B","H_PilotHelmetHeli_O"]) then { if (license_baf_pathfinder) then {player addHeadgear "H_Beret_Colonel"} else { player addHeadgear "H_Beret_02";};};
		if ((goggles player) == "G_Combat") then { removeGoggles player; };
		player addGoggles (profileNamespace getVariable["life_army_noncombat_goggles",""]);
		//if (((vehicle player != player) && (driver vehicle player != player)) || (vehicle player == player)) then { player unassignItem "NVGoggles"; };
		player unassignItem "NVGoggles";
		systemChat "Switched to base gear";
	};
};