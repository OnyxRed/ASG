#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
	Edited for **CarbineGaming**

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = ObjNull;
life_session_completed = false;
life_compTarget = ObjNull;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_siren3_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_wallYellow = ObjNull;
life_wallOrange = ObjNull;
life_trafficCone = ObjNull;
life_barGate = ObjNull;
life_respawn_timer = 0.5; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_god = false;
life_frozen = false;
life_markers = false;
life_smartphoneTarget = ObjNull;
life_fatigue = 0;
life_drink = 0;
life_legal_limit = 0.05;
life_channel_send = true;
life_sitting = false;
life_tent = [];
life_request_timer = false;
life_isSuiciding = false;
life_lock = true;
life_earPlugs = false;

//Backend Variables for EMP
nn_last_vehicles = [];
nn_empInUse = false;

// inventory, class, name, height, distance, damageable
life_placeable =
[
	["roadCone","RoadCone_F","Road Cone",1,4,false],
	["roadConeL","RoadCone_L_F","Road Cone Light",1,4,false],
	["roadBarrier","RoadBarrier_F","Road Barrier",1,4,false],
	["cncBarrier","Land_CncBarrierMedium_F","Concrete Barrier",1,4,false],
	["cncBarrierL","Land_CncBarrierMedium4_F","Concrete Barrier Long",1,4,false],
	["barGate","Land_BarGate_F","Bar Gate",4,4,false],
	["mobileOutpost","Land_Cargo_House_V1_F","Mobile Outpost",4,4,false],
	["floodLightSingle","Land_PortableLight_single_F","Single Flood Light",1,4,false],
	["floodLightDouble","Land_PortableLight_double_F","Double Flood Light",1,4,false],
	["outpostHMG","B_HMG_01_F","Outpost HMG",1,4,false]
];

//Restrict Sling Load
Amarok_RestrictSling = ["I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","O_Truck_03_device_F"];
__CONST__(Amarok_RestrictSling,Amarok_RestrictSling);

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,15000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,375000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,150000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
	switch (playerSide) do
	{
		case west: 
		{
			life_maxWeight = 40;
			life_maxWeightT = 40; 
			life_carryWeight = 0; 
		};
		case independent: 
		{
			life_maxWeight = 35; 
			life_maxWeightT = 35;
			life_carryWeight = 0;
		};
		default 
		{
			life_maxWeight = 24;
			life_maxWeightT = 24;
			life_carryWeight = 0;
		};
	};
/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,15); //request from The Puppeteer
life_cash = 0;
__CONST__(life_impound_car,10000);
__CONST__(life_impound_boat,11500);
__CONST__(life_impound_air,15000);
__CONST__(life_impound_tank,19000);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;
life_placing = objNull;
life_nlrtimer_stop = false;
life_nlrtimer_running = false;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 150000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 150000; //Starting Bank Money
		life_paycheck = 3000; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 150000;
		life_paycheck = 7000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_Heli_Light_01_armed_F","I_Heli_light_03_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","C_Quadbike_01_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_chainsaw",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_handCuffs",
	"life_inv_handCuffKey",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_bombdetect",
	"life_inv_demolitioncharge",
	"life_inv_civdefusekit",
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_moonshine",
	"life_inv_mash",
	"life_inv_kidney",
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	"life_inv_speedbomb",
	"life_inv_scalpel",
	"life_inv_zip",
	"life_inv_tentciv",
	"life_inv_wood",
	"life_inv_joint",
	"life_inv_dogwhistle",
	"life_inv_gpstracker",
	"life_inv_vehAmmo",
	"life_inv_roadCone",
	"life_inv_roadConeL",
	"life_inv_roadBarrier",
	"life_inv_cncBarrier",
	"life_inv_cncBarrierL",
	"life_inv_barGate",
	"life_inv_mobileOutpost",
	"life_inv_floodLightSingle",
	"life_inv_floodLightDouble",
	"life_inv_outpostHMG",
	"life_inv_blindfold",
	"life_inv_ammoBox",
	"life_inv_ammoBoxS",
    "life_inv_wallYellow",
    "life_inv_wallOrange",
    "life_inv_trafficCone",
    "life_inv_houseAlarm",
	"life_inv_fishandchips",
	"life_inv_crumpet",
	"life_inv_tea",
	"life_inv_hobnob",
	"life_inv_richtea",
	"life_inv_fritter",
	"life_inv_lolly",
	"life_inv_bourbons",
	"life_inv_bacon_sandwich",
	"life_inv_crisps",
	
// New Crafting Items
	"life_inv_handgrip",
	"life_inv_trigger",
	"life_inv_9mmCase",
	"life_inv_9mmBullet",
	"life_inv_primer",
	"life_inv_gunpowder",
	"life_inv_glasslens",
	"life_inv_electric",
	"life_inv_steeltube",
	"life_inv_chamber",
	"life_inv_metalcase",
	"life_inv_556Case",
	"life_inv_556Bullet",
	"life_inv_65Case",
	"life_inv_65Bullet",
	"life_inv_762Case",
	"life_inv_762Bullet",
	"life_inv_408Case",
	"life_inv_408Bullet",
	"life_inv_leather",
	"life_inv_thread",
	"life_inv_heavythread",
	"life_inv_metalplate",
	"life_inv_needle",
	"life_inv_zipper",
	"life_inv_45Case",
	"life_inv_45Bullet",
	"life_inv_explosive"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_taxi","civ"],	//Request from The Puppeteer
	["license_civ_busdriver","civ"], //Request from The Puppeteer
	["license_civ_bh","civ"],	//Request from The Puppeteer
	["license_civ_c3","civ"],	//Request from The Puppeteer
	["license_civ_hacker","civ"],	//Request from The Puppeteer
	["license_civ_pmc","civ"],	//Request from The Puppeteer
    ["license_baf_aircorp","cop"], //Army Helicopters
    ["license_baf_aircorp_armed","cop"], //Army Armed Helicopters
    ["license_baf_armour","cop"], //Army Armoured Devision
	["license_baf_mpolice","cop"], //Military Police
	["license_baf_cmedic","cop"], //License to prevent abuse of reviving.
	["license_baf_pathfinder","cop"], //"Elite" army members who won't abuse shit.
	["license_baf_engineer","cop"], //Army members who can tow vehicles, place walls etc
	["license_civ_lawyer","civ"], //Lawyer License
	["licnese_civ_journalist","civ"], //Journalist License
	["license_civ_passport","civ"], //Passport License
	["license_civ_Gangbase1","civ"], //GangBase License
	["license_civ_Gangbase2","civ"], //GangBase License
	["license_civ_Gangbase3","civ"], //GangBase License
	["license_civ_Gangbase4","civ"], //GangBase License
	["license_civ_Gangbase5","civ"], //GangBase License
	["license_civ_Gangbase6","civ"]  //GangBase License
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points69 = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",5000],["heroinp",10000],["cocaine",5000],["cocainep",10000],["cannabis",2500],["marijuana",5000],["turtle",3000],["blastingcharge",10000],["demolitioncharge",15000],["boltcutter",1500],["moonshine",5000],["bottledshine",10000],["mash",5000],["kidney",10000],["speedbomb",15000],["scalpel",5000],["zipties",1000],["lockpick",500],["spikeStrip",7500],["joint",5000]];
life_drug_items = [["heroinu",5000],["heroinp",10000],["cocaine",5000],["cocainep",10000],["cannabis",2500],["marijuana",5000],["joint",5000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["408Bullet",1000],
	["408Case",750],
	["45Bullet",60],
	["45Case",50],
	["556Bullet",200],
	["556Case",150],
	["65Bullet",450],
	["65Case",350],
	["762Bullet",750],
	["762Case",500],
	["9mmBullet",25],
	["9mmCase",10],
	["ammoBox",5000],
	["ammoBoxS",2500],
	["apple",50],
	["barGate",0],
	["beerp",200],
	["blastingcharge",0],
	["blindfold",0],
	["boltcutter",0],
	["bombdetect",0],
	["bottledbeer",3500],
	["bottledshine",11500],
	["bottledwhiskey",6000],
	["bottles",500],
	["catshark",800],
	["cement",3800],
	["chainsaw",0],
	["chamber",500],
	["civdefusekit",0],
	["cncBarrier",500],
	["cncBarrierL",1000],
	["cocaine",1250],
	["cocainep",8750],
	["coffee",5],
	["copper_r",1000],
	["cornmeal",50],
	["defusekit",0],
	["demolitioncharge",0],
	["diamond",1350],
	["diamondc",5800],
	["dogwhistle",0],
	["donuts",60],
	["electric",750],
	["explosive",5000],
	["floodLightDouble",350],
	["floodLightSingle",250],
	["fuelF",500],
	["glass",1500],
	["glasslens",400],
	["goldbar",125000],
	["goldbarp",125000],
	["gpstracker",0],
	["gunpowder",25],
	["handCuffs",50],
	["handCuffKey",10],
	["handgrip",25],
	["heavythead",150],
	["heroinp",6550],
	["heroinu",1500],
	["hops",175],
	["iron_r",1500],
	["joint",1000],
	["kidney",20000],
	["leather",500],
	["lockpick",0],
	["mackerel",400],
	["marijuana",3250],
	["mash",500],
	["metalcase",400],
	["metalplate",800],
	["mobileOutpost",0],
	["moonshine",1500],
	["mullet",350],
	["needle",50],
	["oilp",2000],
	["ornate",50],
	["outpostHMG",15000],
	["peach",125],
	["pickaxe",200],
	["primer",30],
	["rabbit",80],
	["roadBarrier",250],
	["roadCone",75],
	["roadCone",100],
	["rye",175],
	["salema",100],
	["salt_r",500],
	["scalpel",1000],
	["speedbomb",50000],
	["spikeStrip",50],
	["steeltube",250],
	["storagebig",0],
	["storagesmall",0],
	["tbacon",25],
	["tentciv",2500],
	["thread",50],
	["trigger",15],
	["tuna",1000],
	["turtle",18000],
	["tutlesoup",1000],
	["underwatercharge",0],
	["vehAmmo",50000],
	["water",5],
	["whiskey",1000],
	["wood",550],
	["yeast",150],
	["zipper",100],
	["zipties",0],
	["wallYellow",0],
	["wallOrange",0],
	["trafficCone",0],
	["houseAlarm",10000],
	["fishandchips",0],
	["crumpet",0],
	["tea",0],
	["hobnob",0],
	["richtea",0],
	["fritter",0],
	["lolly",0],
	["bourbons",0],
	["bacon_sandwich",0],
	["crisps",0]
	

];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["408Bullet",2000],
	["408Case",1500],
	["45Bullet",120],
	["45Case",100],
	["556Bullet",400],
	["556Case",300],
	["65Bullet",900],
	["65Case",700],
	["762Bullet",1500],
	["762Case",1000],
	["9mmBullet",50],
	["9mmCase",20],
	["ammoBox",10000],
	["ammoBoxS",5000],
	["apple",75],
	["barGate",0],
	["blastingcharge",150000],
	["blindfold",2500],
	["boltcutter",7500],
	["bombdetect",1500],
	["bottledbeer",750],
	["bottledshine",3000],
	["bottledwhiskey",2500],
	["bottles",600],
	["catshark",1000],
	["chainsaw",4000],
	["chamber",1000],
	["civdefusekit",5000],
	["cncBarrier",1000],
	["cncBarrierL",2000],
	["coffee",10],
	["cornmeal",75],
	["defusekit",2500],
	["demolitioncharge",600000],
	["dogwhistle",10000],
	["donuts",120],
	["electric",1500],
	["explosive",10000],
	["floodLightDouble",700],
	["floodLightSingle",500],
	["fuelF",1000],
	["glasslens",800],
	["gpstracker",4000],
	["gunpowder",50],
	["handCuffs",100],
	["handCuffKey",25],
	["handgrip",50],
	["heavythread",300],
	["joint",7500],
	["kidney",30000],
	["leather",1000],
	["lockpick",1500],
	["mackerel",600],
	["metalcase",800],
	["metalplate",1600],
	["mobileOutpost",10000],
	["mullet",700],
	["needle",100],
	["ornate",100],
	["outpostHMG",35000],
	["peach",250],
	["pickaxe",750],
	["primer",60],
	["rabbit",120],
	["roadCone",150],
	["roadConeL",200],
	["roadBarrier",500],
	["salema",150],
	["scalpel",5000],
	["speedbomb",1100000],
	["spikeStrip",2500],
	["steeltube",500],
	["storagebig",150000],
	["storagesmall",75000],
	["tbacon",75],
	["tentciv",5000],
	["thread",100],
	["trigger",30],
	["tuna",1500],
	["turtle",32500],
	["turtlesoup",2500],
	["underwatercharge",20000],
	["vehAmmo",100000],
	["water",5],
	["zipper",200],
	["zipties",2500],
	["wallYellow",0],
	["wallOrange",0],
	["trafficCone",0],
	["houseAlarm",100000],
	["fishandchips",35],
	["crumpet",10],
	["tea",5],
	["hobnob",10],
	["richtea",10],
	["fritter",15],
	["lolly",5],
	["bourbons",10],
	["bacon_sandwich",10],
	["crisps",10]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",14000],
	["C_Van_01_box_F",30000],
	["B_MRAP_01_F",170000],
	["I_Truck_02_transport_F",57500],
	["I_Truck_02_covered_F",40000],
	["B_Truck_01_transport_F",57500],
	["O_Truck_03_transport_F",50000],
	["O_Truck_03_covered_F",55000],
	["B_Truck_01_box_F",55000],
	["O_Truck_03_device_F",145000],
	["B_Heli_Light_01_F",125000],
	["O_Heli_Light_02_unarmed_F",175000],
	["O_Heli_Transport_04_bench_F",150000],
	["C_Heli_Light_01_civil_F",77500],
	["O_Heli_Transport_04_F",140000],
	["B_Heli_Transport_03_F",175000],
	["B_Heli_Transport_01_F",20000],
	["C_Kart_01_Blu_F",0],
	["C_Kart_01_Fuel_F",0],
	["C_Kart_01_Red_F",0],
	["C_Kart_01_Vrana_F",0],
	["I_Truck_02_medical_F",2500],
	["O_Truck_03_medical_F",4500],
	["B_Truck_01_medical_F",6000],
	["O_MRAP_02_F",175000],
	["B_G_Offroad_01_armed_F",25000],
	["I_MRAP_03_hmg_F",920000],
	["B_MRAP_01_hmg_F",916000],
	["B_APC_Wheeled_01_cannon_F",70000],
	["B_APC_Tracked_01_CRV_F",975000],
	["I_Heli_light_03_unarmed_F",245000],
	["O_Heli_Light_02_F",242000],
	["B_Heli_Attack_01_F",250000],
	["C_Rubberboat",1500],
	["C_Boat_Civil_01_F",2200],
	["B_Boat_Transport_01_F",300],
	["C_Boat_Civil_01_police_F",2000],
	["B_SDV_01_F",20000],
	["B_Boat_Armed_01_minigun_F",17500],
	["O_Heli_Transport_04_box_F",250000],
	["I_Heli_Transport_02_F",40000],
	["I_SDV_01_F",15000],
	["B_Heli_Transport_03_unarmed_F",300000],
	["O_Heli_Transport_04_covered_F",350000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",1250],
	["C_Hatchback_01_F",5750],
	["C_Hatchback_01_sport_F",21750],
	["C_Offroad_01_F",8750],
	["C_SUV_01_F",17500],
	["C_Van_01_transport_F",20000],
	["C_Van_01_box_F",30000],
	["B_MRAP_01_F",35000],
	["I_Truck_02_transport_F",37500],
	["I_Truck_02_covered_F",50000],
	["B_Truck_01_transport_F",137500],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",125000],
	["B_Truck_01_box_F",175000],
	["O_Truck_03_device_F",225000],
	["B_Heli_Light_01_F",75000],
	["O_Heli_Light_02_unarmed_F",75000],
	["C_Heli_Light_01_civil_F",75000],
	["O_Heli_Transport_04_F",75000],
	["B_Heli_Transport_03_F",75000],
	["B_Heli_Transport_01_F",75000],
	["C_Kart_01_Blu_F",1500],
	["C_Kart_01_Fuel_F",1500],
	["C_Kart_01_Red_F",1500],
	["C_Kart_01_Vrana_F",1500],
	["I_Truck_02_medical_F",12500],
	["O_Truck_03_medical_F",22500],
	["B_Truck_01_medical_F",30000],
	["O_MRAP_02_F",75000],
	["B_G_Offroad_01_armed_F",125000],
	["I_MRAP_03_hmg_F",100000],
	["B_MRAP_01_hmg_F",80000],
	["B_APC_Wheeled_01_cannon_F",150000],
	["B_APC_Tracked_01_CRV_F",375000],
	["I_Heli_light_03_unarmed_F",75000],
	["O_Heli_Light_02_F",75000],
	["B_Heli_Attack_01_F",75000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",11000],
	["B_Boat_Transport_01_F",1500],
	["C_Boat_Civil_01_police_F",10000],
	["B_SDV_01_F",100000],
	["B_Boat_Armed_01_minigun_F",87500],
	["O_Heli_Transport_04_box_F",275000],
	["I_Heli_Transport_02_F",275000],
	["B_Truck_01_repair_F",120000],
	["C_Van_01_Fuel_F",6000],
	["B_G_Offroad_01_F",17500],
	["O_G_Offroad_01_armed_F",250000],
	["I_MRAP_03_F",95000],
	["B_Heli_Transport_03_unarmed_F",400000],
	["O_Heli_Transport_04_covered_F",350000]
];
__CONST__(life_garage_sell,life_garage_sell);