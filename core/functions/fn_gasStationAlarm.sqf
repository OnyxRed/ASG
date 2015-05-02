/*
	File: fn_gasStationAlarm.swf
	Author: Jaffa
	
	Description:
	Medic Play gas station alarm
*/
private["_shop"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _shop) exitWith {};
if(isNil {_shop getVariable "robberyInProgress"}) exitWith {};

while {true} do
{
    if(!(_shop getVariable "robberyInProgress")) exitWith {};
    if(!alive _shop) exitWith {};
    if(isNull _shop) exitWith {};
    _shop say3D "security_alarm";
    sleep 10.0036;
};