/*
	File: fn_zipTieAction.sqf
	Author: Bad^^Eye
	
	Description:
	Main functionality for civ restrain
*/
private["_attacker","_victim","_curWeap","_curMags"];
_attacker = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _attacker) exitWith {};

player setVariable["zipTie",true,true];
player setVariable["tf_unable_to_use_radio", true];
life_myGrp = group player;
[player] joinSilent grpNull;
if(!(_attacker getVariable["bountyHunter",false])) then {
	[[getPlayerUID _attacker,name _attacker,"207"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;};
	
_curWeap = currentWeapon player;
_curMags = magazines player;
{player removeMagazine _x;} forEach _curMags;
player setAmmo [_curWeap,0];

if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };
titleText[format["You have been ziptied by %1",_attacker getVariable["realname",name _attacker]],"PLAIN"];

while {player getVariable "zipTie"} do
{
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "zipTie")};
	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then {player action["GetOut",vehicle player];};
	};
	if(!alive player) then
	{
		player setVariable ["zipTie",false,true];
		player setVariable ["tf_unable_to_use_radio", false];
		[player] joinSilent life_myGrp;
	};
};

[player] join life_myGrp;

if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	player setVariable ["tf_unable_to_use_radio", false];
	detach player;
	if(count _curMags != 0) then
	{
		{player addMagazine _x;} foreach _curMags;
	};
};