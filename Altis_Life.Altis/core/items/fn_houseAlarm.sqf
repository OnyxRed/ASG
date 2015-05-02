/*
  House Alarm System
  Alarm Item

  Copyright (C) 2015 Carbine Gaming
  All Rights Reserved
*/
private["_house"];
_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
if (_house getVariable["houseAlarm",false]) exitWith {hint "Your house is already equipped with an alarm!"};

_house setVariable["houseAlarm",true,true];
[[_house],"TON_fnc_addHouseAlarm",false,false] spawn life_fnc_MP;
hint "Your house is now protected by an alarm. If someone tries to break it, the alarm will sound and you and the police will be alerted.";