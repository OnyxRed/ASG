private["_position","_gate"];
_gate = "Land_BarGate_F" createVehicle [0,0,0];
_gate attachTo[player,[0,5.5,1]];
_gate setDir 90;
_gate setVariable["item","wallDeployed",true];

life_action_barGateDeploy = player addAction["Deploy Bar Gate",{if(!isNull life_barGate) then {detach life_barGate; life_barGate = ObjNull;}; player removeAction life_action_barGateDeploy; life_action_barGateDeploy = nil;},"",999,false,false,"",'!isNull life_barGate'];
life_barGate = _gate;
waitUntil {isNull life_barGate};
if(!isNil "life_action_barGateDeploy") then {player removeAction life_action_barGateDeploy;};
if(isNull _gate) exitWith {life_barGate = ObjNull;};
_gate setPos [(getPos _gate select 0),(getPos _gate select 1),0];
_gate allowDamage false;