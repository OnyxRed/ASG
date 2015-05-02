#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) < 3)) then {
  ["NotWhitelisted",false,true] call BIS_fnc_endMission;
  sleep 35;
};

if ((str(player) in ["hato_1","hato_2","hato_3","hato_4","hato_5"]) && (__GETC__(life_coplevel) != 12)) then {
  ["NotWhitelisted",false,true] call BIS_fnc_endMission;
  sleep 35;
};

if (!(str(player) in ["hato_1","hato_2","hato_3","hato_4","hato_5"]) && (__GETC__(life_coplevel) == 12)) then {
  ["NotWhitelisted",false,true] call BIS_fnc_endMission;
  sleep 35;
};

// Set Paycheck for Police For Each rank
switch (__GETC__(life_coplevel)) do 
{
	        case 1: {life_paycheck = life_paycheck + 500;}; //CSO
			case 2: {life_paycheck = life_paycheck + 750;}; //PCSO
			case 3: {life_paycheck = life_paycheck + 1250;}; //PC 1
			case 4: {life_paycheck = life_paycheck + 1500;}; //PC 2
			case 5: {life_paycheck = life_paycheck + 1750;}; //PC 4
			case 6: {life_paycheck = life_paycheck + 2000;}; //SPC
			case 7: {life_paycheck = life_paycheck + 2250;}; // SGT
			case 8: {life_paycheck = life_paycheck + 2500;}; // Insp
			case 9: {life_paycheck = life_paycheck + 2750;}; // C/Insp
			case 10: {life_paycheck = life_paycheck + 3000;}; // Supt
			case 11: {life_paycheck = life_paycheck + 3250;}; // C/Supt
			case 12: {life_paycheck = life_paycheck + 2000;}; // Rank 12 HATO
			case 13: {life_paycheck = 2500;}; // Rank 13 ARMY
};


//Setup Army Frequencies
if (!(__GETC__(life_coplevel) == 12)) then {
    	["TFRSetLRFreq_LRChange", "OnLRChange", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
		}, player] call TFAR_fnc_addEventHandler;
        
        ["TFRSetSWFreq_SWChange", "OnSWChange", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
		}, player] call TFAR_fnc_addEventHandler;
        
        ["TFRSetSWFreq_RadioOwnerSet", "OnRadioOwnerSet", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
		}, player] call TFAR_fnc_addEventHandler;

        ["TFRSetLRFreq_LRchannelSet", "OnLRchannelSet", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
        }, player] call TFAR_fnc_addEventHandler;
        
        ["TFRSetSWFreq_SWchannelSet", "OnSWchannelSet", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
        }, player] call TFAR_fnc_addEventHandler;
        
        ["TFRSetFreq_RadioRecieve", "OnRadiosReceived", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
        }, player] call TFAR_fnc_addEventHandler;
		
		["TFRSetFreq_OnRadioOpen", "OnRadioOpen", {
            [] spawn life_fnc_initTFARRadioLR;
            [] spawn life_fnc_initTFARRadioSW;
        }, player] call TFAR_fnc_addEventHandler;
		
		
};


player setVariable["rank",(__GETC__(life_coplevel)),true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


[] call life_fnc_equipGear;