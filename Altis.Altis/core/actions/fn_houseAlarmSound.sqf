/*
  House Alarm System
  Alarm Sound and Alert for Police and Owner

  Copyright (C) 2015 Carbine Gaming
  All Rights Reserved
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

for [{_i = 0},{_i < 45},{_i = _i + 1}] do {
    if (!(_house getVariable["houseAlarmActive",false])) exitWith {};
    _house say3D "house_alarm";
    sleep 7;
};