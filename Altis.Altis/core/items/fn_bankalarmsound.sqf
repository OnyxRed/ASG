private["_vault"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
for [{_i = 0},{_i < 45},{_i = _i + 1}] do {
  if(!(fed_bank getVariable["chargeplaced",false])) exitWith {};
  _vault say3D "bank_alarm";
  sleep 23;
};