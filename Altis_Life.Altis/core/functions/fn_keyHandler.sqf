#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false]) || (player getVariable ["zipTie",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//1 Key
	case 2:
	{
		if(isNull (findDisplay 2400) && ((__GETC__(life_adminlevel) > 4) || ((playerSide == west && ((player distance (getMarkerPos "cop_spawn_1") < 100) OR  (player distance (getMarkerPos "cop_spawn_2") < 100) OR (player distance (getMarkerPos "cop_spawn_3") < 100) OR (player distance (getMarkerPos "cop_spawn_4") < 100) OR (player distance (getMarkerPos "cop_spawn_5") < 100) OR (player distance (getMarkerPos "cop_spawn_6") < 100))) || ((player getVariable ["bountyHunter",false]) && ((player distance (getMarkerPos "bh_1_1") < 100) || (player distance (getMarkerPos "bh_hq") < 100))) || vehicle player getVariable ["copCar",false] || vehicle player getVariable ["bhCar",false]))) then {
			closeDialog 0;
			[] call life_fnc_wantedMenu;
		};
	};

	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Escape Intro camera
	case 1: // ESC
	{
		if (!isNil "life_camera_cancel") then {
			life_camera_cancel = true;
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};

	//O = Cop Opener
	case 24:
	{
        if ((playerSide != civilian) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
		
		if(vehicle player getVariable ["emergencyVehicle",false] && vehicle player != player && ((driver vehicle player) == player) && life_lock) then
		{
			life_lock = false;
			[[vehicle player],"life_fnc_copHorn",true,false] spawn life_fnc_MP;
			[] spawn { sleep 1; life_lock = true; };
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
        if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "zipTie") && speed cursorTarget < 1) then
		{
            [] call life_fnc_zipTieAction;
        };
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	
	// P: ear plugs
	case 25:
	{
		if (_shift) then {
			[] call life_fnc_earPlugs;
			_handled = true;
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !(player getVariable["paintball",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				if("ItemRadio" in assignedItems cursorTarget) then {
				cursorTarget removeweapon "ItemRadio";
				hint "The cellphone of the person was placed on the ground.";
				_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);}
				else { hint "The person that you knock out have no cellphone!"};
		   };
		};
	};

	//Surrender is TAB
	case 46:
	{
		if(!_alt && !_ctrlKey && !dialog && _shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	
	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				}
				else
				{
					if(typeOf cursorTarget in["IG_supplyCrate_F","Box_NATO_Grenades_F"] && {!(cursorTarget getVariable ["locked_crate",true])} ) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Hatchback_01_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","I_MRAP_03_hmg_F","I_MRAP_03_F","B_APC_Wheeled_01_cannon_F","B_MRAP_01_hmg_F","B_G_Offroad_01_repair_F","C_Van_01_box_F","B_G_Van_01_transport_F","I_Truck_02_box_F","I_Truck_02_covered_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
	};
	
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33:
	{
        if (!_shift) then
        {
		if((playerSide == west) && ((__GETC__(life_coplevel) < 12) || license_baf_mpolice) && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren_active = true;
                    sleep 4.7;
                    life_siren_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
                if((_veh getVariable "siren")) then
                {
                    titleText ["Sirens Off","PLAIN"];
                    _veh setVariable["siren",false,true];
                }
                    else
                {
                    titleText ["Sirens On","PLAIN"];
                    _veh setVariable["siren",true,true];
				if(playerSide == west) then {
                    [[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
                };
            };                                            
        };
		};
		
        if (!_shift) then
		{
		if ((playerSide == independent) && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren_active = true;
                    sleep 4.7;
                    life_siren_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
                if((_veh getVariable "siren")) then
                {
                    titleText ["Sirens Off","PLAIN"];
                    _veh setVariable["siren",false,true];
                }
                    else
                {
                    titleText ["Sirens On","PLAIN"];
                    _veh setVariable["siren",true,true];
					
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
                };
            };                                            
        };
		
		if(_shift) then
        {
        if((playerSide == west) && ((__GETC__(life_coplevel) < 12) || license_baf_mpolice) && vehicle player != player && !life_siren3_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren3_active = true;
                    sleep 1.2;
                    life_siren3_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren3"}) then {_veh setVariable["siren3",false,true];};
                if((_veh getVariable "siren3")) then
                {
                titleText ["Yelp Off","PLAIN"];
                _veh setVariable["siren3",false,true];
                }
                    else
                {
                    titleText ["Yelp On","PLAIN"];
                    _veh setVariable["siren3",true,true];
						
                    [[_veh],"life_fnc_copsiren3",nil,true] spawn life_fnc_MP;
                };
            };
		};
		
		if(!_shift) then
		{
        if((playerSide == west) && (__GETC__(life_coplevel) == 12) && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren2_active = true;
                    sleep 1.2;
                    life_siren2_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
                if((_veh getVariable "siren2")) then
                {
                    titleText ["Yelp Off","PLAIN"];
                    _veh setVariable["siren2",false,true];
                }
                    else
                {
                    titleText ["Yelp On","PLAIN"];
                    _veh setVariable["siren2",true,true];
                    [[_veh],"life_fnc_copsiren2",nil,true] spawn life_fnc_MP;
                };
			};
		};
	};
	
	//case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["I_Heli_light_03_unarmed_F"])) then
		{
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };
	
	//U Key
	case 22:
	{
		if(true) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
                    _doorAction = 2;
                    
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
						player say3D "car_lock";
                        _doorAction = 1;
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};	
						systemChat localize "STR_MISC_VehLock";
						player say3D "unlock";
                        _doorAction = 0;
					};
                    
                    if (_doorAction == 0 || _doorAction == 1) then{
                        if (_veh isKindOf "B_MRAP_01_F" || _veh isKindOf "B_MRAP_01_hmg_F" || _veh isKindOf "B_MRAP_01_gmg_F") then{
                            _veh animateDoor ['door_LF', _doorAction, false];
                            _veh animateDoor ['door_RF', _doorAction, false];
                            _veh animateDoor ['door_LB', _doorAction, false];
                            _veh animateDoor ['door_RB', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "O_MRAP_02_F" || _veh isKindOf "O_MRAP_02_hmg_F" || _veh isKindOf "O_MRAP_02_gmg_F") then{
                            _veh animateDoor ['door_LF', _doorAction, false];
                            _veh animateDoor ['door_RF', _doorAction, false];
                            _veh animateDoor ['door_LM', _doorAction, false];
                            _veh animateDoor ['door_RM', _doorAction, false];
                            _veh animateDoor ['door_rear', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "I_MRAP_03_F" || _veh isKindOf "I_MRAP_03_hmg_F" || _veh isKindOf "I_MRAP_03_gmg_F") then{
                            _veh animateDoor ['door_LF', _doorAction, false];
                            _veh animateDoor ['door_RF', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "B_Heli_Transport_01_F" || _veh isKindOf "B_Heli_Transport_01_camo_F") then{
                            _veh animateDoor ['door_L', _doorAction, false];
                            _veh animateDoor ['door_R', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "O_Heli_Attack_02_F" || _veh isKindOf "O_Heli_Attack_02_black_F") then{
                            _veh animateDoor ['door_L', _doorAction, false];
                            _veh animateDoor ['door_R', _doorAction, false];
                            _veh animateDoor ['door_L_pop', _doorAction, false];
                            _veh animateDoor ['door_R_pop', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "O_Heli_Transport_04_F" || _veh isKindOf "O_Heli_Transport_04_ammo_F" || _veh isKindOf "O_Heli_Transport_04_box_F" || _veh isKindOf "O_Heli_Transport_04_fuel_F" || _veh isKindOf "O_Heli_Transport_04_repair_F") then{
                            _veh animateDoor ['door_1_source', _doorAction, false];
                            _veh animateDoor ['door_2_source', _doorAction, false];
                            _veh animateDoor ['door_3_source', _doorAction, false];
                        };
                        if (_veh isKindOf "O_Heli_Transport_04_covered_F" || _veh isKindOf "O_Heli_Transport_04_medevac_F") then{
                            _veh animateDoor ['door_3_source', _doorAction, false];
                            _veh animateDoor ['door_4_source', _doorAction, false];
                            _veh animateDoor ['door_5_source', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "I_Heli_Transport_02_F") then{
                            _veh animateDoor ['Door_Back_L', _doorAction, false];
                            _veh animateDoor ['Door_Back_R', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "B_Heli_Transport_03_F" || _veh isKindOf "B_Heli_Transport_03_unarmed_F") then{
                            _veh animateDoor ['door_L_source', _doorAction, false];
                            _veh animateDoor ['door_R_source', _doorAction, false];
                        };
                        
                        if (_veh isKindOf "C_Offroad_01_F" || _veh isKindOf "B_G_Offroad_01_repair_F" || _veh isKindOf "O_G_Offroad_01_armed_F") then{
                            _veh animate ["HideDoor1", _doorAction];
                            _veh animate ["HideDoor2", _doorAction];
                            _veh animate ["HideDoor3", _doorAction];
                        };
                    };
				};
			};
		};
	};
	
	// Z: Turn signal left
	case 16: {
		if ((alive player) && {!(player getVariable ["wounded",false])} && {!(player getVariable ["restrained",false])} && {(vehicle player != player)} && {(vehicle player isKindOf "LandVehicle")} && {(driver vehicle player == player)}) then {
			if (vehicle player getVariable ["turnsignal",""] == "left") then {
				vehicle player setVariable ["turnsignal", "", true];
			} else {
				if (!(player getVariable ["turnspam", false]) || (vehicle player getVariable ["turnsignal",""] == "right")) then {
					[] spawn {
						player setVariable ["turnspam", true, false];
						sleep 2;
						player setVariable ["turnspam", false, false];
					};
					{
						{
							if (isPlayer _x) then {
								[[vehicle player,"left"],"life_fnc_vehTurnsignal", _x, false] spawn life_fnc_MP;
							};
						} forEach crew _x; 
					} forEach (player nearEntities [["Man","Car","Air","Ship"],50]); 
				};
			};
		};
	};
	
	// X: Turn signal right
	case 18: {
		if ((alive player) && {!(player getVariable ["wounded",false])} && {!(player getVariable ["restrained",false])} && {(vehicle player != player)} && {(vehicle player isKindOf "LandVehicle")} && {(driver vehicle player == player)}) then {
			if (vehicle player getVariable ["turnsignal",""] == "right") then {
				vehicle player setVariable ["turnsignal", "", true];
			} else {
				if (!(player getVariable ["turnspam", false]) || (vehicle player getVariable ["turnsignal",""] == "left")) then {
					[] spawn {
						player setVariable ["turnspam", true, false];
						sleep 2;
						player setVariable ["turnspam", false, false];
					};
					{
						{
							if (isPlayer _x) then {
								[[vehicle player,"right"],"life_fnc_vehTurnsignal", _x, false] spawn life_fnc_MP;
							};
						} forEach crew _x; 
					} forEach (player nearEntities [["Man","Car","Air","Ship"],50]); 
				};
			};
		};
	};	

	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Takwondo!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};

	//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			};
	};

	//Pushup(Shift + Num 4)
	case 75:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
			};
	};
  
  //Mining hotkey: J
  case 36:
  {
    if (!_shift && !_alt) then {
      [] spawn life_fnc_pickaxeUse;
    };
  };
};

if (_code in (actionKeys "Throw") && (player getVariable "restrained" OR player getVariable "transporting" OR player getVariable "zipTie" OR player getVariable "surrender" or (animationState player == "Incapacitated"))) then {
	_handled = true;
};

if ((player getVariable["blindfolded",false] || player getVariable["zipTie",false] || player getVariable["restrained",false]) && (_code in (actionKeys "ShowMap") || _code in (actionKeys "MiniMap") || _code in (actionKeys "MiniMapToggle"))) then
{
	systemChat "How could you read a map in this state...?" ;
	_handled = true;
};

_handled;