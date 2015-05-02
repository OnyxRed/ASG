/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_invoker"];
_invoker = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(vehicle player == player) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
    titleText[localize "STR_NOTF_PulledOut","PLAIN",0.5];
} else {
    titleText[format[localize "STR_NOTF_PulledOutName",_invoker getVariable["realname",name _invoker]],"PLAIN",0.5];
    systemChat format[localize "STR_NOTF_PulledOutName",_invoker getVariable["realname",name _invoker]];
};

player action ["GetOut", vehicle player];
titleFadeOut 4;