private["_position","_cone"];
_cone = "RoadCone_L_F" createVehicle [0,0,0];
_cone attachTo[player,[0,5.5,0.2]];
_cone setDir 90;
_cone setVariable["item","wallDeployed",true];

life_action_trafficConeDeploy = player addAction["Deploy Traffic Cone",{if(!isNull life_trafficCone) then {detach life_trafficCone; life_trafficCone = ObjNull;}; player removeAction life_action_trafficConeDeploy; life_action_trafficConeDeploy = nil;},"",999,false,false,"",'!isNull life_trafficCone'];
life_trafficCone = _cone;
waitUntil {isNull life_trafficCone};
if(!isNil "life_action_trafficConeDeploy") then {player removeAction life_action_trafficConeDeploy;};
if(isNull _cone) exitWith {life_trafficCone = ObjNull;};
_cone setPos [(getPos _cone select 0),(getPos _cone select 1),0];
_cone allowDamage false;