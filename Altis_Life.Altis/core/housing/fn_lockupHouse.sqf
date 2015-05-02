/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks up the entire house and closes all doors.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH

titleText [localize "STR_House_LockingUp","PLAIN"];
sleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animate[format["door_%1_rot",_i],0];
	_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
};

_house setVariable["locked",true,true];
_house setVariable["houseAlarmActive",false,true];
[[_house],"TON_fnc_houseAlarmMarkerRemove",_owner,false] spawn life_fnc_MP;
[[_house],"TON_fnc_houseAlarmMarkerPoliceRemove",west,false] spawn life_fnc_MP;
titleText[localize "STR_House_LockedUp","PLAIN"];