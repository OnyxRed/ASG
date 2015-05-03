/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if((side _source == west || (_source getVariable["bountyHunter",false])) && playerSide != west) then
			{
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

//rubber bullets
if(!isNull _source) then {
	if(_source != _unit) then {
		_curMag = currentMagazine _source;
		if (_curMag in ["30Rnd_65x39_caseless_mag_Tracer","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_556x45_Stanag_Tracer_Red"] && _projectile in ["B_65x39_Caseless","B_45ACP_Ball","B_556x45_Ball_Tracer_Red"]) then {
			if((side _source == west) || (_source getVariable["bountyHunter",false]) && playerSide != west) then
			{
				private["_isVehicle","_isQuad"];
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				_damage = false;	
				
				if(_isVehicle || _isQuad) then {
					player action ["Eject",vehicle player];
					[_unit,_source] spawn life_fnc_handleDowned;
				} else {
					[_unit,_source] spawn life_fnc_handleDowned;
				};
			};
			
			if(side _source == west && playerSide == west) then {
				_damage = false;
			};
		};
	};
};

// Safe zone check!
if (player distance getMarkerPos "safe_zone_kav" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
} else {
	if ({player distance getMarkerPos (_x select 0) < _x select 1} count (call life_safe_points) > 0) then
	{
		if (vehicle player != player) then {
			// In a vehicle.
			if (!((vehicle player) isKindOf "Air")) then {
				_damage = false;
				vehicle player setDamage 0;
			};
		} else {
			_damage = false;
			player setDamage 0;
		}
	};
};
	
if (player distance getMarkerPos "safe_zone_syr" < 101) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if(!isNull _source) then {
   _isVehicle = if(vehicle _source != _source) then {true} else {false};
   if (_isVehicle) then {
        _damage = false;
   };
};

if (player distance getMarkerPos "safe_zone_4" < 101) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_2" < 101) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_3" < 101) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_rebel" < 101) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_7" < 500) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_hq" < 51) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_zaros" < 401) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_gangshops" < 151) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_1" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_2" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_3" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_4" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_5" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_6" < 15) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

if (player distance getMarkerPos "safe_zone_kav_7" < 25) then {
	if (vehicle player != player) then {
		// In a vehicle. Check for choppers, disable the setDamage for those.
		if (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly))) then {
			_damage = false;
			vehicle player setDamage 0;
		};
	};
	
	if (vehicle player == player || (!((vehicle player) isKindOf "Air") && !((typeOf (vehicle player)) in (call life_vShop_rentalOnly)))) then {
		_damage = false;
		player setDamage 0;
	};
};

//Stop medics being killed
if (playerSide == independent) then {
    if (!isNull _source) then {
        if ((_source != _unit) && (vehicle _source == _source)) then {
        [_unit,_source,false] spawn life_fnc_handleDowned;
        _damage = false;
        };
    };
};

//Stop HATO being killed
if (playerSide == west) then {
    if ((player getVariable["rank",1] == 12) && (!isNull _source)) then {
        if ((_source != _unit) && (vehicle _source == _source)) then {
        [_unit,_source,false] spawn life_fnc_handleDowned;
        _damage = false;
        };
    };
};

[] call life_fnc_hudUpdate;
_damage;