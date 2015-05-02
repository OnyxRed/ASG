/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew","_vector"];
if (player distance cursorTarget > 5) exitWith {hint "The vehicle is too far away";};
_vector = velocity cursorTarget;
if ((speed cursorTarget) >= 10) exitWith {hint "The vehicle is going too fast!";};
_crew = crew cursorTarget;
{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
//		[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
        [[player], "life_fnc_pulloutVeh", _x, false] spawn life_fnc_MP;
} foreach _crew;