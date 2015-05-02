/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		// Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		
		// Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];

		// Check for Bombs
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Check for Bombs</t>",life_fnc_bombDetect,"",99,false,true,"",' player distance cursorTarget < 5 && (cursorTarget getVariable["dchargeplaced",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		
		// Defuse Bombs
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Defuse Explosives</t>", life_fnc_bombDefuseKit,"",99,false,false,"",' player distance cursorTarget < 5 && (cursorTarget getVariable["dchargefound",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		
		// Harvest Organs
		life_actions = life_actions + [player addAction["Harvest Organs",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];		

		// Suicide Vest
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Activate Suicide Jacket</t>",life_fnc_suicideBomb,"",0,false,false,"",
        'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !life_isSuiciding && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];	
		
		// Air Vehicle Ejection (For Helicopter Pilots and Co-Pilots Mostly... :(   Thanks to A3Wasteland
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Emergency Eject</t>",life_fnc_forceEject,"",0,false,false,"", ' (vehicle player) isKindOf "Air" && (driver vehicle player) == player)']];
	};
	
	case west:
	{
		// Seize PlayerWeapons
		life_actions = life_actions + [player addAction["Seize Weapons",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		life_actions = life_actions + [player addAction["Packup Yellow Wall",life_fnc_packUpWallYellow,"",0,false,false,"",' _wall = nearestObjects[getPos player,["PlasticBarrier_02_yellow_F"],8] select 0; !isNil "_wall" && !isNil {(_wall getVariable "item")}']];
		life_actions = life_actions + [player addAction["Packup Orange Wall",life_fnc_packUpWallOrange,"",0,false,false,"",' _wall = nearestObjects[getPos player,["PlasticBarrier_03_orange_F"],8] select 0; !isNil "_wall" && !isNil {(_wall getVariable "item")}']];
		life_actions = life_actions + [player addAction["Packup Cone",life_fnc_packUpCone,"",0,false,false,"",' _cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_cone" && !isNil {(_cone getVariable "item")}']];
		life_actions = life_actions + [player addAction["Packup Gate",life_fnc_packUpGate,"",0,false,false,"",' _gate = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_gate" && !isNil {(_gate getVariable "item")}']];
	};

};

//Sit Down
life_actions = life_actions + [player addAction["<t color='#0099FF'>Sit Down</t>",life_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_ChairWood_F")']];

//Stand Up
life_actions = life_actions + [player addAction["<t color='#0099FF'>Stand Up</t>", life_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];