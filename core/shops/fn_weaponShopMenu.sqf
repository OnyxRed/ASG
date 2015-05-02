/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};
if((_this select 3) == "gangbase1" && !license_civ_Gangbase1) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
if((_this select 3) == "gangbase2" && !license_civ_Gangbase2) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
if((_this select 3) == "gangbase3" && !license_civ_Gangbase3) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
if((_this select 3) == "gangbase4" && !license_civ_Gangbase4) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
if((_this select 3) == "gangbase5" && !license_civ_Gangbase5) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
if((_this select 3) == "gangbase6" && !license_civ_Gangbase6) exitWith {hint localize "STR_Shop_Notown"; closeDialog 0;};
_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;