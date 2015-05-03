#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

	Section 1: Weapons
	Section 2: Armor
	Section 3: Clothing
	Section 4: Ammo
	Section 5: Optics and Attachments
*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]

						//Section 1
						["hgun_Rook40_F", ["life_inv_handgrip",1,"life_inv_ironr",1,"life_inv_trigger",1]],
						["SMG_01_F", ["life_inv_chamber",1,"life_inv_ironr",2,"life_inv_steeltube",1,"life_inv_trigger",1,"life_inv_handgrip",1,"life_inv_metalcase",1]],
						["arifle_TRG20_F", ["life_inv_chamber",1,"life_inv_ironr",2,"life_inv_steeltube",1,"life_inv_trigger",1,"life_inv_handgrip",1,"life_inv_metalcase",1]],
						["arifle_Katiba_F", ["life_inv_chamber",1,"life_inv_ironr",3,"life_inv_steeltube",2,"life_inv_trigger",1,"life_inv_handgrip",1,"life_inv_metalcase",1]],

						//Section 2
						["V_Rangemaster_belt", ["life_inv_leather",1,"life_inv_thread",1]],
						["V_BandollierB_blk", ["life_inv_leather",3,"life_inv_heavythread",2]],
						["V_TacVest_blk", ["life_inv_leather",3,"life_inv_heavythread",2,"life_inv_metalplate",1,"life_inv_zipper",1]],
						["V_PlateCarrier1_blk", ["life_inv_leather",4,"life_inv_heavythread",4,"life_inv_metalplate",2,"life_inv_zipper",2]],
						["V_PlateCarrier_Kerry", ["life_inv_leather",5,"life_inv_heavythread",5,"life_inv_metalplate",4,"life_inv_zipper",2]],

						//Section 3
						["U_I_CombatUniform_tshirt", ["life_inv_leather",2,"life_inv_thread",2,"life_inv_zipper",1]],
						["U_B_CombatUniform_mcam", ["life_inv_leather",2,"life_inv_thread",2,"life_inv_zipper",1]],
						["U_I_OfficerUniform", ["life_inv_leather",2,"life_inv_thread",3,"life_inv_zipper",1]],
						["U_O_GhillieSuit", ["life_inv_leather",4,"life_inv_heavythread",2,"life_inv_zipper",2]],

						//Section 4
						["16Rnd_9x21_Mag", ["life_inv_9mmCase",1,"life_inv_9mmBullet",1,"life_inv_primer",1,"life_inv_gunpowder",1]],
						["30Rnd_45ACP_Mag_SMG_01", ["life_inv_45Case",1,"life_inv_45Bullet",1,"life_inv_primer",1,"life_inv_gunpowder",1]],
						["30Rnd_556x45_Stanag", ["life_inv_556Case",1,"life_inv_556Bullet",1,"life_inv_primer",1,"life_inv_gunpowder",1]],
						["30Rnd_65x39_caseless_green", ["life_inv_65Case",1,"life_inv_65Bullet",1,"life_inv_primer",1,"life_inv_gunpowder",1]],
						["20Rnd_762x51_Mag", ["life_inv_762Bullet",1,"life_inv_762Case",1,"life_inv_primer",2,"life_inv_gunpowder",2]],
						//["RPG32_F", ["life_inv_metalcase",4,"life_inv_steeltube",4,"life_inv_explosive",2,"life_inv_electric",2]],
						//["HandGrenade", ["life_inv_metalcase",1,"life_inv_explosive",1,"life_inv_primer",1]],
						//["SatchelCharge_Remote_Mag", ["life_inv_leather",4,"life_inv_metalcase",2,"life_inv_explosive",2,"life_inv_primer",2,"life_inv_heavythread",4]],

						//Section 5
						["muzzle_snds_L", ["life_inv_steeltube",2,"life_inv_chamber",1]],
						["muzzle_snds_B", ["life_inv_steeltube",4,"life_inv_chamber",1]],
						["muzzle_snds_H", ["life_inv_steeltube",2,"life_inv_chamber",1]],
						["muzzle_snds_acp", ["life_inv_steeltube",2,"life_inv_chamber",1]],
						["optic_SOS", ["life_inv_steeltube",2,"life_inv_metalcase",1,"life_inv_glasslens",2]],
						["optic_DMS", ["life_inv_steeltube",3,"life_inv_metalcase",1,"life_inv_glasslens",3]],
						["optic_LRPS", ["life_inv_steeltube",4,"life_inv_metalcase",2,"life_inv_glasslens",5]]
					]
				];
			};
		};
	};
};