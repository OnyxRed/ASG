[] spawn 
{
	disableSerialization;
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {_randomnr = [2,-1] call BIS_fnc_selectRandom;(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir (vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};
	
	player setVariable["Talking", false, true];
	
	while {true} do 
	{
		waitUntil 
		{
			sleep 1;
			if ( (player getVariable "Talking") ) then
			{
				player setVariable["Talking", false, true];
			};
			((!isNull findDisplay 63) && (!isNull findDisplay 55))
		};

		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
		{
			if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_side") OR (ctrlText ((findDisplay 63) displayCtrl 101) == "Side Channel")) then 
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 180;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;
						warn_three = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						systemChat ("Please do not use voice on sidechat, this is your first warning.");
						[] spawn DS_slap_them;
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 1) then {
					if (isNil "warn_two") then {
						warn_two = true;
						systemChat ("Please do not use voice on sidechat, this is your second warning..");
						[] spawn DS_slap_them;
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 2) then {
					if (isNil "warn_three") then {
						warn_three = true;
						systemChat ("PLEASE DO NOT USE VOICE ON SIDECHAT!! This is your LAST warning!");
						systemChat ("You will be frozen and then disconnected!");
						[] spawn DS_slap_them;
						["NO VOICE ON SIDE! This is your LAST warning!"] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 3) then {
					if (isNil "warn_last") then {
						warn_last = true;
						if(player getVariable "unconscious") then { player setDamage 2.303583; sleep 11;};
						["We warned you..."] spawn DS_double_cut;
						1 fademusic 10;
						1 fadesound 10;
						disableUserInput true;
						life_sidechat = false;
						[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
						startLoadingScreen ["You are being disconnected"];
						progressLoadingScreen 0.4;sleep 2.25;
						progressLoadingScreen 0.8;sleep 2.25;
						endLoadingScreen;sleep 0.5;
						disableUserInput false;
						endMission "LOSER";
					};
				};
			};
			
			if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_direct") OR (ctrlText ((findDisplay 63) displayCtrl 101) == "Direct Communication")) then 
			{
				//if ( !(player getVariable "Talking") ) then
				//{
					player setVariable["Talking", true, true];
				//};
			}
			else
			{
				if ( (player getVariable "Talking") ) then
				{
					player setVariable["Talking", false, true];
				};
			};
		}
		else
		{
			if ( (player getVariable "Talking") ) then
			{
				player setVariable["Talking", false, true];
			};
		};
		sleep 1;
	};
};