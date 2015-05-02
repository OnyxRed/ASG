private["_position","_wall"];
_wall = "PlasticBarrier_02_yellow_F" createVehicle [0,0,0];
_wall attachTo[player,[0,5.5,0.2]];
_wall setDir 90;
_wall setVariable["item","wallDeployed",true];

life_action_wallYellowDeploy = player addAction["Deploy Yellow Wall",{if(!isNull life_wallYellow) then {detach life_wallYellow; life_wallYellow = ObjNull;}; player removeAction life_action_wallYellowDeploy; life_action_wallYellowDeploy = nil;},"",999,false,false,"",'!isNull life_wallYellow'];
life_wallYellow = _wall;
waitUntil {isNull life_wallYellow};
if(!isNil "life_action_wallYellowDeploy") then {player removeAction life_action_wallYellowDeploy;};
if(isNull _wall) exitWith {life_wallYellow = ObjNull;};
_wall setPos [(getPos _wall select 0),(getPos _wall select 1),0];
_wall allowDamage false;