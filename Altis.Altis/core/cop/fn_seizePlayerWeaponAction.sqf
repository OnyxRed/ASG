/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	Slightly adapted by Daniel Larusso (Keep Calm and Roleplay)
	
	Description:
	Removes the players weapons client side
*/
private["_blacklist","_itemArray","_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];

_blacklist = [1] call life_fnc_seizeCfg;

[] call life_fnc_saveGear;

_itemArray = life_gear;
if(count _itemArray == 0) exitWith {
	[[52, player, format["%1 has no weapons or ammunition.", name cursorTarget]],"TON_fnc_logIt",false,false] spawn life_fnc_MP;
};


removeAllWeapons player;
[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
[] call life_fnc_civLoadGear;
titleText["Your Guns Got Seized.","PLAIN"];