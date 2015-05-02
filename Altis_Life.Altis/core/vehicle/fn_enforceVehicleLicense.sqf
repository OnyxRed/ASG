/*
	Author: Jaffa

	Description:
	Enforces licenses on vehicles, stops random players getting into powerful vehicles like armed helicopters.
	Passed arguments are [vehicle:Object, position:String, unit:Object, turret:Array]

	Parameter(s):
		0: Object - Vehicle that the player gets into.
        1: String - name of position, possible values are "driver", "gunner", "commander", "cargo"
        2: Array - Turret path user got into.
	
	Returns:
	BOOL
*/
private["_vehicle","_seat","turret","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_seat = [_this,1,"cargo"];
_turret = [_this,2,[-1]] call BIS_fnc_param;
_veh = typeOf _vehicle;
if (isNull _veh) exitWith { };

if (_veh == "B_Heli_Light_01_armed_F") then {
    if (_seat == "driver") && !(license_baf_aircorp_armed) then {
        player action ["GetOut", _vehicle];
        hint localize "STR_Shop_Veh_NoLicense";
        STR_Shop_Veh_NoLicense
    } else {
        hint localize "STR_Veh_Armed_GetIn";
    };
};

if (_veh == "I_Heli_light_03_F") then {
    if (_seat == "driver") && !(license_baf_aircorp_armed) then {
        player action ["GetOut", _vehicle];
        hint localize "STR_Shop_Veh_NoLicense";
    } else {
        hint localize "STR_Veh_Armed_GetIn";
    };
};

if (_veh == "B_Heli_Transport_01_camo_F") then {
    if (_seat == "driver") && !(license_baf_aircorp_armed) then {
        player action ["GetOut", _vehicle];
        hint localize "STR_Shop_Veh_NoLicense";
    } else {
        hint localize "STR_Veh_Armed_GetIn";
    };
};

if (_veh == "B_APC_Wheeled_01_cannon_F") then {
    if (_seat == "gunner") && !(license_baf_armour) then {
        player action ["GetOut", _vehicle];
        hint localize "STR_Shop_Veh_NoLicense";
    } else {
        hint localize "STR_Veh_Armed_GetIn";
    };
};