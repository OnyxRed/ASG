#include <macro.h>
/*
	File: fn_initTFARRadioLR.sqf
*/
private["_radio","_hasRadio","_speakers","_allPositions"];
_veh = _this;
if (isNull _veh) exitWith { diag_log "No vehicle passed to Vehicle LR init." };
_hasRadio = _veh call TFAR_fnc_hasVehicleRadio;
if (playerSide == west) then {
    if !(_veh getVariable["TFRFreqSet",false]) then {
		if (!_hasRadio) then {
			_veh setVariable ["tf_side", west, true];
			_veh setVariable ["tf_hasRadio", true, true];
		};
        {
            _radio = [_veh,_x];
            (_radio select 0) setVariable["TFRFreqSet",true,true];
			(_radio select 0) setVariable["TF_speakerDistance",50,true];
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
            if (!(_speakers) && (_x == "driver_radio_settings")) then {
                [_radio select 0, _radio select 1] call TFAR_fnc_setLrSpeakers;
            };
        } forEach ["driver_radio_settings","gunner_radio_settings","commander_radio_settings","turretUnit_0_radio_setting"];
        [_radio,true] call TFAR_fnc_ShowRadioInfo;
        systemChat "Vehicle LR TFR Setup completed.";
    };
};