/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,30] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained") && !(_unit getVariable "zipTie")) exitWith {}; //He's not restrained or ziptied.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid


[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

if (_unit getVariable "restrained") then{
  [true,"handCuffs",1] call life_fnc_handleInv;
};

if (_unit getVariable "zipTie") then{
  [true,"zipties",1] call life_fnc_handleInv;
};

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false,_time],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;