#include <macro.h>
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

//[] spawn {
//  while {dialog} do {
//   closeDialog 0;
//   sleep 0.01;
//  };
//};
 
if(life_god) then {
	life_god = false;
	hint "God mode disabled";
	player allowDamage true;
} else {
	life_god = true;
	hint "God mode enabled";
	player allowDamage false;
}; 