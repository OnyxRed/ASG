private["_wall"];
_wall = nearestObjects[getPos player,["PlasticBarrier_02_yellow_F"],8] select 0;
if(isNil "_wall") exitWith {};

if(([true,"wallYellow",1] call life_fnc_handleInv)) then
{
	titleText["You have packed up the wall.","PLAIN"];
	player removeAction life_action_wallPickupYellow;
	life_action_wallPickupYellow = nil;
	deleteVehicle _wall;
};