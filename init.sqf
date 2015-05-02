enableSaving [false, false];
enableRadio false;

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

introSpawn = nil;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

if (isNull life_variableObj) then {
    diag_log "!!!Variable Object not found!!!";
    sleep 3;
} else {
    life_variableObj allowDamage false;
    life_variableObj enableSimulation false;
    diag_log "Variable Object Set";
};

life_versionInfo = "Altis Life RPG v3.1.4.8";
life_firstSpawn = true;
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "core\weather\fn_weather.sqf";
[] execVM "core\cop\fn_teargas.sqf";
[] execVM "scripts\welcome.sqf";
[] execVM "scripts\message.sqf";
[] execVM "scripts\fn_noSideChat.sqf";
[] execVM "scripts\fieldRandom.sqf";
//[] execVM "scripts\statusBar.sqf";

if(isDedicated && isNil("life_market_prices")) then
{
	[] call TON_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
};

//Hide gold markers
{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];

StartProgress = true;