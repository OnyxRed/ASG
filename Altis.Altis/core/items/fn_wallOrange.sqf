private["_position","_wall"];
_wall = "PlasticBarrier_03_orange_F" createVehicle [0,0,0];
_wall attachTo[player,[0,5.5,0.2]];
_wall setDir 90;
_wall setVariable["item","wallDeployed",true];

life_action_wallOrangeDeploy = player addAction["Deploy Orange Wall",{if(!isNull life_wallOrange) then {detach life_wallOrange; life_wallOrange = ObjNull;}; player removeAction life_action_wallOrangeDeploy; life_action_wallOrangeDeploy = nil;},"",999,false,false,"",'!isNull life_wallOrange'];
life_wallOrange = _wall;
waitUntil {isNull life_wallOrange};
if(!isNil "life_action_wallOrangeDeploy") then {player removeAction life_action_wallOrangeDeploy;};
if(isNull _wall) exitWith {life_wallOrange = ObjNull;};
_wall setPos [(getPos _wall select 0),(getPos _wall select 1),0];
_wall allowDamage false;