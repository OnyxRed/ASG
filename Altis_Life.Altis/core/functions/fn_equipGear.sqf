#include <macro.h>
/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initializes custom gear textures
*/
switch (true) do {

    //Cop Uniform
	case (playerSide == west && (uniform player) == "U_B_CombatUniform_mcam"): {
		switch (__GETC__(life_coplevel)) do {
			case 1: { [player,"textures\uniform\cop\Police_PCSO_Uniform.paa"] call life_fnc_setUniform;};
			case 2: { [player,"textures\uniform\cop\Police_PCSO_Uniform.paa"] call life_fnc_setUniform;};
			case 3: { [player,"textures\uniform\cop\scotpol_hvuniform.paa"] call life_fnc_setUniform;};
			case 4: { [player,"textures\uniform\cop\scotpol_hvuniform.paa"] call life_fnc_setUniform;};
			case 5: { [player,"textures\uniform\cop\scotpol_hvuniform.paa"] call life_fnc_setUniform;};
			case 6: { [player,"textures\uniform\cop\scotpol_hvuniform.paa"] call life_fnc_setUniform;};
			case 7: { [player,"textures\uniform\cop\Police_Uniform.paa"] call life_fnc_setUniform;};
            case 8: { [player,"textures\uniform\cop\Police_Uniform.paa"] call life_fnc_setUniform;};
            case 9: { [player,"textures\uniform\cop\Police_Uniform.paa"] call life_fnc_setUniform;};
            case 10: { [player,"textures\uniform\cop\Police_Uniform.paa"] call life_fnc_setUniform;};
            case 11: { [player,"textures\uniform\cop\Police_Uniform.paa"] call life_fnc_setUniform;};
            case 12: { [player,"textures\uniform\cop\HATO_uniform.paa"] call life_fnc_setUniform;};
		};
	};

    //Army Uniform
    case (playerSide == west && (uniform player) == "U_B_CTRG_1"): {
		switch (__GETC__(life_coplevel)) do {
			case 13: { [player,"textures\uniform\army\Army_Uniform.paa"] call life_fnc_setUniform;};
		};
	};

    //Medic Uniform
    case (playerSide == independent && (uniform player) == "U_B_CombatUniform_mcam"): {
        player setObjectTextureGlobal[0,"textures\uniform\medic\Paramedic_Uniform.paa"];
    };

    
	//Prisoner
	case ((uniform player) == "U_C_WorkerCoveralls"): {
		[player,"textures\uniform\prisoner\prisoner.jpg"] call life_fnc_setUniform;
	};
	
	//Lumberjack
	case ((uniform player) == "U_C_Poloshirt_stripped"): {
		[player,"textures\uniform\civilian\lumberjack.paa"] call life_fnc_setUniform;
	};
};

[] spawn life_fnc_initTFARRadioLR;
[] spawn life_fnc_initTFARRadioSW;