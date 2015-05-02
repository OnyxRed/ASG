/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_chainsaw": {(localize "STR_Item_Chainsaw")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_handCuffs": {(localize "STR_Item_HandCuffs")};
	case "life_inv_handCuffKey": {(localize "STR_Item_HandCuffKey")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_bombdetect": {(localize "STR_Item_BDetect")};
	case "life_inv_civdefusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_demolitioncharge": {(localize "STR_Item_DCharge")};
	case "life_inv_yeast": {(localize "STR_Item_Yeast")};
	case "life_inv_rye": {(localize "STR_Item_Rye")};
	case "life_inv_hops": {(localize "STR_Item_Hops")};
	case "life_inv_whiskey": {(localize "STR_Item_DWhiskey")};
	case "life_inv_beerp": {(localize "STR_Item_FBeer")};
	case "life_inv_bottles": {(localize "STR_Item_GlassBottles")};
	case "life_inv_cornmeal": {(localize "STR_Item_Cornmeal")};
	case "life_inv_bottledwhiskey": {(localize "STR_Item_BWhiskey")};
	case "life_inv_bottledbeer": {(localize "STR_Item_BBeer")};
	case "life_inv_bottledshine": {(localize "STR_Item_BMoonshine")};
	case "life_inv_moonshine": {(localize "STR_Item_DMoonshine")};
	case "life_inv_kidney": {(localize "STR_Item_Kidney")};
	case "life_inv_underwatercharge": {(localize "STR_Item_UCharge")};
	case "life_inv_goldbarp": {(localize "STR_Item_GoldScrap")};
	case "life_inv_speedbomb": {(localize "STR_Item_SpeedBomb")};
	case "life_inv_scalpel": {(localize "STR_Item_Scalpel")};
	case "life_inv_zip": {(localize "STR_Item_ZipTies")};
	case "life_inv_blindfold": {(localize "STR_Item_Blindfold")};
	case "life_inv_tentciv": {(localize "STR_Item_Tent")};
	case "life_inv_joint": {(localize "STR_Item_Joint")};
	case "life_inv_dogwhistle": {(localize "STR_Item_DogWhistle")};
	case "life_inv_gpstracker": {(localize "STR_Item_GPSTracker")};
	case "life_inv_vehAmmo": {(localize "STR_Item_VehAmmo")};
	case "life_inv_roadCone": {(localize "STR_Item_RoadCone")};
	case "life_inv_roadConeL": {(localize "STR_Item_RoadConeL")};
	case "life_inv_roadBarrier": {(localize "STR_Item_RoadBarrier")};
	case "life_inv_cncBarrier": {(localize "STR_Item_cncBarrier")};
	case "life_inv_cncBarrierL": {(localize "STR_Item_cncBarrierL")};
	case "life_inv_barGate": {(localize "STR_Item_barGate")};
	case "life_inv_mobileOutpost": {(localize "STR_Item_mobileOutpost")};
	case "life_inv_floodLightSingle": {(localize "STR_Item_floodLightSingle")};
	case "life_inv_floodLightDouble": {(localize "STR_Item_floodLightDouble")};
	case "life_inv_outpostHMG": {(localize "STR_Item_outpostHMG")};
	case "life_inv_ammoBox": {(localize "STR_Item_AmmoBox")};
	case "life_inv_ammoBoxS": {(localize "STR_Item_AmmoBoxS")};
	case "life_inv_handgrip": {(localize "STR_Item_Handgrip")};
	case "life_inv_trigger": {(localize "STR_Item_Trigger")};
	case "life_inv_9mmCase": {(localize "STR_Item_9mmCase")};
	case "life_inv_9mmBullet": {(localize "STR_Item_9mmBullet")};
	case "life_inv_primer": {(localize "STR_Item_Primer")};
	case "life_inv_gunpowder": {(localize "STR_Item_Gunpowder")};
	case "life_inv_wood": {(localize "STR_Item_Wood")};
	case "life_inv_glasslens": {(localize "STR_Item_Glasslens")};
	case "life_inv_electric": {(localize "STR_Item_Electric")};
	case "life_inv_steeltube": {(localize "STR_Item_Steeltube")};
	case "life_inv_chamber": {(localize "STR_Item_Chamber")};
	case "life_inv_metalcase": {(localize "STR_Item_Metalcase")};
	case "life_inv_556Case": {(localize "STR_Item_556Case")};
	case "life_inv_556Bullet": {(localize "STR_Item_556Bullet")};
	case "life_inv_65Case": {(localize "STR_Item_65Case")};
	case "life_inv_65Bullet": {(localize "STR_Item_65Bullet")};
	case "life_inv_762Case": {(localize "STR_Item_762Case")};
	case "life_inv_762Bullet": {(localize "STR_Item_762Bullet")};
	case "life_inv_408Case": {(localize "STR_Item_408Case")};
	case "life_inv_408Bullet": {(localize "STR_Item_408Bullet")};
	case "life_inv_leather": {(localize "STR_Item_Leather")};
	case "life_inv_thread": {(localize "STR_Item_Thread")};
	case "life_inv_heavythread": {(localize "STR_Item_Heavythread")};
	case "life_inv_metalplate": {(localize "STR_Item_Metalplate")};
	case "life_inv_needle": {(localize "STR_Item_Needle")};
	case "life_inv_zipper": {(localize "STR_Item_Zipper")};
	case "life_inv_45Bullet": {(localize "STR_Item_45Bullet")};
	case "life_inv_45Case": {(localize "STR_Item_45Case")};
	case "life_inv_explosive": {(localize "STR_Item_Explosive")};
	case "life_inv_wallYellow": {"Yellow Wall"};
	case "life_inv_wallOrange": {"Orange Wall"};
	case "life_inv_trafficCone": {"Traffic Cone"};
	case "life_inv_barGate": {"Bar Gate"};
	case "life_inv_arrowleft": {"Left Arrow"};
	case "life_inv_arrowright": {"Right Arrow"};
	case "life_inv_houseAlarm": {"House Alarm"};
	case "life_inv_crisps": {"Crisps"};
	case "life_inv_bacon_sandwich": {"Bacon Sandwich"};
	case "life_inv_fritter": {"Potato Fritter"};
	case "life_inv_lolly": {"Lollipop"};
	case "life_inv_richtea": {"Rich tea"};
	case "life_inv_hobnob": {"Hobnobs"};
	case "life_inv_tea": {"Tea"};
	case "life_inv_crumpet": {"Crumpets"};
	case "life_inv_fishandchips": {"Fish and Chips"};
	case "life_inv_bourbons": {"Bourbons"};
	
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_taxi": {(localize "STR_License_Taxi")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_stiller": {(localize "STR_License_Distiller")};
	case "license_civ_liquor": {(localize "STR_License_Liquor")};
	case "license_civ_bottler": {(localize "STR_License_Bottler")};
	case "license_civ_bh": {(localize "STR_License_Bounty")};
	case "license_civ_c3": {(localize "STR_License_Class3")};
	case "license_civ_hacker": {(localize "STR_License_Hacker")};	//Request from The Puppeteer
	case "license_civ_pmc": {(localize "STR_License_PMC")};	//Request from The Puppeteer
    case "license_baf_aircorp": {(localize "STR_License_BAFAircorp")};	//Army helicopters
    case "license_baf_aircorp_armed": {(localize "STR_License_BAFAircorp_Armed")};	//Army armed helicopters
    case "license_baf_armour": {(localize "STR_License_BAFArmourDevision")};	//Army Armoured Division
	case "license_baf_mpolice": {(localize "STR_License_BAFMilitaryPolice")}; // Military Police
	case "license_baf_cmedic": {(localize "STR_License_BAFCombatMedic")}; // Combat Medic
	case "license_baf_pathfinder": {(localize "STR_License_BAFPathFinder")}; // Path finder
	case "license_baf_engineer": {(localize "STR_License_BAFEngineer")}; // Royal Engineers
	case "license_civ_passport": {(localize "STR_License_passport")};
	case "license_civ_busdriver": {(localize "STR_License_busdriver")};
	case "license_civ_journalist": {(localize "STR_License_journalist")};
	case "license_civ_lawyer": {(localize "STR_License_lawyer")};
	case "license_civ_Gangbase1": {(localize "STR_License_Gangbase1")};	//Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase2": {(localize "STR_License_Gangbase2")}; //Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase3": {(localize "STR_License_Gangbase2")}; //Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase4": {(localize "STR_License_Gangbase3")}; //Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase5": {(localize "STR_License_Gangbase4")}; //Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase6": {(localize "STR_License_Gangbase5")}; //Request from The Puppeteer //Gangbases
	case "license_civ_Gangbase7": {(localize "STR_License_Gangbase6")}; //Request from The Puppeteer //Gangbases
};
