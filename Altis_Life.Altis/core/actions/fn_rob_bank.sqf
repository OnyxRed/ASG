/*
	File: fn_robShops.sqf

		Author: MrKraken
		Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
		
	Description:
	Executes the rob shob action!
	Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint "You can not rob this station!" };
if(_robber distance _shop > 5) exitWith { hint "You need to be within 5m of the cashier to rob him!" };

if (isNil "_kassa") then { _kassa = 1000; };
if (_rip) exitWith { hint "Robbery already in progress!" };
if (vehicle player != _robber) exitWith { hint "Get out of your vehicle!" };

if !(alive _robber) exitWith {};
if ((currentWeapon _robber == "") OR (!(currentWeapon _robber == primaryWeapon _robber) && !(currentWeapon _robber == handgunWeapon _robber))) exitWith { hint "You can't rob a shop without a gun!" };
if (_kassa == 0) exitWith { hint "There is no cash in the register!" };
if (_shop getVariable ["robberyInProgress",false]) exitWith { hint "A robbery is already in progress!" };

_chance = random(100);
if(_chance >= 25) then
{
	hint "The cashier hit the silent alarm, police has been alerted!";
	[[1,format["ALARM! - Kavala Building Society is being robbed!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};

_cops = (west countSide playableUnits);
if(_cops < 6) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "You cannot rob the Bank unless there is 7 police officers online!";};
disableSerialization;

_rip = true;
_kassa = 100000 + round(random 550000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";

5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
_shop setVariable["robberyInProgress",true,true];
[[_shop],"life_fnc_gasStationAlarm",nil,true] spawn life_fnc_MP;
if(_rip) then
{
while{true} do
{
sleep 5.5;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Robbery in Progress, stay close (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "!ATTENTION! Armed Robbery !ATTENTION!";
				                "Marker200" setMarkerType "mil_warning";	
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith {_shop switchMove ""; hint "You need to stay within 10m to Rob registry! - Now the register is locked."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["You have stolen £%1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
_shop setVariable["robberyInProgress",false,true];
_rip = false;
life_use_atm = false;
sleep (900 + random(1200));
life_use_atm = true;
if!(alive _robber) exitWith {};

};
deleteMarker "Marker200";
_shop setVariable["robberyInProgress",false,true];
sleep 5000;
_action = _shop addAction["Rob the Bank",life_fnc_rob_bank];	
_shop switchMove "";