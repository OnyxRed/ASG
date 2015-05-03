/*
    ALAH SNACKBAR!
Created By: TAW_Tonic
Edited By: Peter Beer
Tested and Approved by: Capt. Fitzsimmons and 617th PMC
*/
private["_test"];
if(vest player != "V_HarnessOGL_gry") exitWith {};
life_isSuiciding = true;
[[getPlayerUID player,profileName,"101"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[0,format["Somebody will blow up in 30 seconds!"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 15;
[[0,format["Somebody will blow up in 15 seconds!!!"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 15; 
life_isSuiciding = false;
[[0,format["%1 went kaboom!",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

[[player, "bombarm",100],"life_fnc_playSound",true,false] spawn life_fnc_MP;
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1.028131;};