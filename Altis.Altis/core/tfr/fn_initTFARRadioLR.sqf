#include <macro.h>
/*
	File: fn_initTFARRadioLR.sqf
*/
private["_radio","_hasRadio","_speakers"];
_hasRadio = call TFAR_fnc_haveLRRadio;
if (_hasRadio && playerSide == west) then {
    _radio = (call TFAR_fnc_activeLrRadio);
    if !((_radio select 0) getVariable["TFRFreqSet",false]) then {
        (_radio select 0) setVariable["TFRFreqSet",true,true];
        [_radio select 0, _radio select 1, "_bluefor"] call TFAR_fnc_setLrRadioCode;
        //Set seperate channels for Army/Cop
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
        [_radio select 0, _radio select 1, 7] call TFAR_fnc_setLrChannel;
        //[_radio select 0, _radio select 1, 7] call TFAR_fnc_setAdditionalLrChannel;
        _speakers = _radio call TFAR_fnc_getLrSpeakers;
        //if !(_speakers) then {
        //    [_radio select 0, _radio select 1] call TFAR_fnc_setLrSpeakers;
        //};
        [_radio, true] call TFAR_fnc_ShowRadioInfo;
        systemChat "LR TFR Setup completed.";
    };
};