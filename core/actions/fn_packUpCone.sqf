private["_cone"];
_cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_cone") exitWith {};

if(([true,"trafficCone",1] call life_fnc_handleInv)) then
{
	titleText["You have packed up the traffic cone.","PLAIN"];
	player removeAction life_action_pickupCone;
	life_action_pickupCone = nil;
	deleteVehicle _cone;
};