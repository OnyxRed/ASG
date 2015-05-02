private["_wall"];
_wall = nearestObjects[getPos player,["PlasticBarrier_03_orange_F"],8] select 0;
if(isNil "_wall") exitWith {};

if(([true,"wallOrange",1] call life_fnc_handleInv)) then
{
	titleText["You have packed up the wall.","PLAIN"];
	player removeAction life_action_wallPickupOrange;
	life_action_wallPickupOrange = nil;
	deleteVehicle _wall;
};