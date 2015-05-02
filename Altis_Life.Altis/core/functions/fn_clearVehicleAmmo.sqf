/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(_veh == "O_Heli_Attack_02_black_F") then {
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if(_veh == "B_HMG_01_F") then {
	_vehicle removeMagazinesTurret ["500Rnd_127x99_mag",[0]];
};

if(_veh == "O_MRAP_02_hmg_F") then {
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
};

if(_veh == "B_MRAP_01_hmg_F") then {
	_vehicle addWeaponTurret ["FakeWeapon",[0]];
};

if((_veh == "B_Heli_Transport_01_camo_F") || (_veh == "B_Heli_Transport_01_F")) then {
    _vehicle lockTurret [[1], true];
    _vehicle lockTurret [[2], true];
    _vehicle removeMagazineGlobal "2000Rnd_65x39_Belt_Tracer_Red";
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
    _vehicle removeWeaponTurret ["LMG_Minigun_Transport",[1]];
    _vehicle removeWeaponTurret ["LMG_Minigun_Transport2",[2]];
    if (_veh == "B_Heli_Transport_01_camo_F") then {
        _vehicle addWeaponTurret ["M134_minigun",[-1]];
        _vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[-1]];
        _vehicle addWeaponTurret ["FakeWeapon",[-1]];
        _vehicle selectWeaponTurret ["FakeWeapon", [-1]];
    };
};

if(_veh == "I_Heli_light_03_F") then {
    _vehicle removeMagazineGlobal "24Rnd_missiles";
    _vehicle removeWeaponGlobal "missiles_DAR";
    _vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
    _vehicle removeWeaponTurret ["missiles_DAR",[-1]];
    _vehicle addWeaponTurret ["FakeWeapon",[-1]];
    _vehicle selectWeaponTurret ["FakeWeapon", [-1]];
};

if(_veh == "O_Heli_Light_02_F") then {
    _vehicle removeMagazineGlobal "12Rnd_PG_missiles";
    _vehicle removeMagazineGlobal "24Rnd_PG_missiles";
    _vehicle removeWeaponGlobal "missiles_DAGR";
    _vehicle addWeaponTurret ["FakeWeapon",[-1]];
    _vehicle selectWeaponTurret ["FakeWeapon", [-1]];
};

if (_veh == "B_Heli_Light_01_armed_F") then {
    _vehicle removeMagazineGlobal "24Rnd_missiles";
    _vehicle removeWeaponGlobal "missiles_DAR";
    _vehicle addWeaponTurret ["FakeWeapon",[-1]];
    _vehicle selectWeaponTurret ["FakeWeapon", [-1]];
};

if (_veh == "B_APC_Wheeled_01_cannon_F") then {
    _vehicle removeMagazineGlobal "60Rnd_40mm_GPR_Tracer_Red_shells";
    _vehicle removeMagazineGlobal "40Rnd_40mm_APFSDS_Tracer_Red_shells";
    _vehicle removeWeaponGlobal "autocannon_40mm_CTWS","LMG_M200";
    _vehicle addWeaponTurret ["FakeWeapon",[0]];
    _vehicle selectWeaponTurret ["FakeWeapon", [0]];
};


clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;