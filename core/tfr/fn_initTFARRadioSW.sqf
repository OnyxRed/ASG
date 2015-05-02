#include <macro.h>
/*
	File: fn_initTFARRadioSW.sqf
*/
private["_radio","_radioVarName","_radioVar,","_hasRadio"];
_hasRadio = call TFAR_fnc_haveSWRadio;
if (_hasRadio && playerSide == west) then {
    _radio = call TFAR_fnc_activeSwRadio;
    _radioVarName = format ["TFRFreqSet_%1", _radio];
    _radioVar = life_variableObj getVariable[_radioVarName,false];
    if !(_radioVar) then {
        life_variableObj setVariable[_radioVarName,true];
        [_radio, "_bluefor"] call TFAR_fnc_setSwRadioCode;
        if (__GETC__(life_coplevel) == 13) then {
            //Army 1 Section
            [_radio, 1, "72.6"] call TFAR_fnc_SetChannelFrequency;
            //Army 2 Section
            [_radio, 2, "52.1"] call TFAR_fnc_SetChannelFrequency;
			//Cop Standard
			[_radio, 4, "32.8"] call TFAR_fnc_SetChannelFrequency;
        } else {
            //Cop Standard
            [_radio, 1, "32.8"] call TFAR_fnc_SetChannelFrequency;
            //Cop Special 1
            [_radio, 2, "153.8"] call TFAR_fnc_SetChannelFrequency;
            //Cop Special 2
            [_radio, 3, "113.2"] call TFAR_fnc_SetChannelFrequency;
        };
        //Combined Ops
        [_radio, 7, "49.7"] call TFAR_fnc_SetChannelFrequency;
		//Long Range
        [_radio, 8, "69.1"] call TFAR_fnc_SetChannelFrequency;
        //[_radio, 7] call TFAR_fnc_setAdditionalSwChannel;
        [_radio,false] call TFAR_fnc_ShowRadioInfo;
        systemChat "SW TFR Setup completed.";
    };
};