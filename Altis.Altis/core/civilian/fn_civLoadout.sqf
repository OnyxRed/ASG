/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player forceAddUniform (_clothings select (floor(random (count _clothings))));

switch (call life_donator) do {

case 1: {
    hint "Donation Gear Loaded";
    player addBackpack "B_Carryall_khk";
    player addWeapon "NVGoggles";
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";
    player addItem "ItemRadio";
    player assignItem "ItemRadio";
    player addItem "Toolkit";
    player addItem "FirstAidKit";
};

case 2: {
    hint "Donation Gear Loaded";
    player addBackpack "B_Carryall_khk";
    player addWeapon "NVGoggles";
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";
    player addItem "ItemRadio";
    player assignItem "ItemRadio";
    player addItem "Toolkit";
    player addItem "FirstAidKit";
    player additem "ItemGPS";
    player additem "V_Rangemaster_belt";
    player addheadgear "H_Watchcap_blk";
};

case 3: {
    hint "Donation Gear Loaded";
    player addBackpack "B_Carryall_khk";
    player addWeapon "NVGoggles_OPFOR";
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";
    player addItem "ItemRadio";
    player assignItem "ItemRadio";
    player addItem "Toolkit";
    player addItem "FirstAidKit";
    player additem "ItemGPS";
    player assignItem "ItemGPS";
    player addVest "V_BandollierB_khk";
    player addUniform "U_NikosBody";
    player addheadgear "H_Watchcap_blk";
	player addMagazines ["9Rnd_45ACP_Mag", 3];
	player addWeapon "hgun_ACPC2_F";
	missionNamespace setVariable["license_civ_gun",true];
	[2] call SOCK_fnc_updatePartial;
};
default {
/* ITEMS */
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";
    player addItem "ItemRadio";
    player assignItem "ItemRadio";
};
};


[] call life_fnc_saveGear;
[] call life_fnc_equipGear;