private["_gate"];
_gate = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_gate") exitWith {};

if(([true,"barGate",1] call life_fnc_handleInv)) then
{
	titleText["You have packed up the gate.","PLAIN"];
	player removeAction life_action_pickupGate;
	life_action_pickupGate = nil;
	deleteVehicle _gate;
};