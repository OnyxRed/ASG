#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;
if(__GETC__(life_coplevel) == 12 && __GETC__(life_adminlevel) < 4) exitWith { hint "You are not allowed to view the wanted list."};

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Connecting..."];

if(__GETC__(life_coplevel) < 7 && __GETC__(life_adminlevel) < 5) then
{
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;