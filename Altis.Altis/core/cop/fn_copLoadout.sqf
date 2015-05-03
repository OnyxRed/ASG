#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
if (__GETC__(life_coplevel) == 13) then{
    player addUniform "U_B_CTRG_1";
} else {
    player addUniform "U_B_CombatUniform_mcam";
};

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

/* Assign UAV Terminal to HATO */
if (__GETC__(life_coplevel) == 12) then{
    player linkItem "B_UavTerminal";
    player linkItem "NVGoggles";
} else {
    player linkItem "ItemGPS";
};

/* Assign TFR radio to army */
if (__GETC__(life_coplevel) == 12) then{
    player linkItem "ItemRadio";
} else {
    player linkItem "tf_anprc152";
};

/* Army Gear */
if (__GETC__(life_coplevel) == 13) then{
    player addVest "V_PlateCarrierH_CTRG";
    player addBackpack "B_Kitbag_cbr";
    player addItem "NVGoggles";
    player addWeapon "Rangefinder";
    player addHeadgear "H_Beret_02";
    player addMagazines ["30Rnd_556x45_Stanag_Tracer_Green", 8];
    player addWeapon "arifle_TRG21_F";
    player addPrimaryWeaponItem "optic_Hamr";
    player addPrimaryWeaponitem "acc_flashlight";
    player addItem "acc_pointer_IR";
	if (license_baf_cmedic) then { player addItem "Medikit"; } 
	else { player addItem "FirstAidKit"; };
	if (license_baf_engineer) then { player addItem "ToolKit"; };
	[true,"donuts",3] call life_fnc_handleInv;
	[true,"coffee",2] call life_fnc_handleInv;
	[true,"handCuffs",5] call life_fnc_handleInv;
};

[] call life_fnc_saveGear;
[] call life_fnc_equipGear;