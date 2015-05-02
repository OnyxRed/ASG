/*
  House Alarm System
  Alarm Sound and Alert for Police and Owner

  Copyright (C) 2015 Carbine Gaming
  All Rights Reserved
*/
private["_house","_burglar","_burglarName","_owner","_policeMessage","_ownerMessage","_ownerId","_ownerName"];
_owner = objNull;
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_burglar = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {systemChat "House null";};
_ownerId = (_house getVariable["house_owner",nil]) select 0;
_ownerName = (_house getVariable ["house_owner",nil]) select 1;
if (!(_house getVariable["houseAlarm",false])) exitWith {};
if (_house getVariable["houseAlarmActive",false]) exitWith {};
_house setVariable["houseAlarmActive",true,true];
{
	if(getPlayerUID _x == _ownerId) then {
    _owner = _x;
  };
} foreach playableUnits;
_burglarName = name _burglar;

_policeMessage = format["%1 has tripped %2's house alarm whilst breaking in!",_burglarName,_ownerName];
[[0,_policeMessage],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[_house,_ownerName,_burglarName],"TON_fnc_houseAlarmMarkerPolice",west,false] spawn life_fnc_MP;

if (!(isNull _owner)) then{
  _ownerMessage = format["%1 has tripped your house alarm when attempting to break in!",_burglarName];
  [[0,_ownerMessage],"life_fnc_broadcast",_owner,false] spawn life_fnc_MP;
  [[2,_ownerMessage],"life_fnc_broadcast",_owner,false] spawn life_fnc_MP;
  [[_house,_ownerName,_burglarName],"TON_fnc_houseAlarmMarker",_owner,false] spawn life_fnc_MP;
};

[[_house],"life_fnc_houseAlarmSound",true,true] spawn life_fnc_MP;
sleep 315;


if (_house getVariable["houseAlarmActive",false]) then {
_house setVariable["houseAlarmActive",false,true];
};

if (!(isNull _owner)) then{
  [[_house,_ownerName,_burglarName],"TON_fnc_houseAlarmMarkerRemove",_owner,false] spawn life_fnc_MP;
};
[[_house,_ownerName,_burglarName],"TON_fnc_houseAlarmMarkerPoliceRemove",west,false] spawn life_fnc_MP;
