#include <macro.h>
/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["apple","bottles","chainsaw","civdefusekit","fuelF","gpstracker","peach","pickaxe","rabbit","storagesmall","storagebig","tbacon","fishandchips","fritter","crumpet","hobnob","richtea","bourbons","bacon_sandwich","crisps","tentciv","underwatercharge","water","tea","wood","ammoBoxS","ammoBox","houseAlarm"]]};
	case "rebel": {["Rebel Market",["blastingcharge","blindfold","boltcutter","demolitioncharge","fuelF","lockpick","rabbit","apple","speedbomb","tbacon","underwatercharge","vehAmmo","water","zipties","ammoBoxS","ammoBox"]]};
	case "gangbase" : {["Gang Market",["blastingcharge","blindfold","boltcutter","bottledbeer","bottledshine","bottledwhiskey","joint","demolitioncharge","fuelF","lockpick","rabbit","apple","speedbomb","tbacon","underwatercharge","vehAmmo","water","zipties","ammoBoxS","ammoBox"]]};
	case "gang": {["Gang Market", ["blastingcharge","blindfold","boltcutter","bottledbeer","bottledshine","bottledwhiskey","fuelF","gpstracker","joint","lockpick","rabbit","tbacon","apple","water","zipties"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","methp","joint"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["ornate","salema","mullet","mackerel","catshark","tuna"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "medic": {["Dr.SideBurn's Item Cart",["apple","fuelF","peach","rabbit","tbacon","lolly","Water","coffee"]]};
	case "cop":
	{
		switch(true) do
		{
			case (__GETC__(life_coplevel) == 0 ):
			{["Cop Item Shop",["coffee","donuts","handCuffs","handCuffKey","tbacon"]]};
			case (__GETC__(life_coplevel) == 1 ):
			{["Cop Item Shop",["coffee","donuts","gpstracker","handCuffs","handCuffKey","tbacon"]]};
			case (__GETC__(life_coplevel) == 2 ):
			{["Cop Item Shop",["bombdetect","civdefusekit","coffee","donuts","defusekit","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon","fuelF"]]};
			case (__GETC__(life_coplevel) == 3 ):
			{["Cop Item Shop",["bombdetect","civdefusekit","coffee","donuts","defusekit","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon","fuelF"]]};
			case (__GETC__(life_coplevel) == 4 ):
			{["Cop Item Shop",["bombdetect","civdefusekit","coffee","donuts","defusekit","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon","fuelF"]]};
            case (__GETC__(life_coplevel) == 12 ):
			{["HATO Roadworks Equipment",["wallYellow","wallOrange","trafficCone","barGate","arrowleft","arrowright","floodLightSingle","floodLightDouble","donuts","coffee","water","rabbit","apple","redgull","tbacon","fishchips","fuelF","lockpick","handCuffKey"]]};
            case (__GETC__(life_coplevel) == 13 ):
			{["British Armed Forces Shop",["bombdetect","civdefusekit","defusekit","coffee","donuts","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon","fuelF","ammoBox"]]};
			case (__GETC__(life_coplevel) >= 6 ):
			{["Cop Item Shop",["bombdetect","civdefusekit","coffee","donuts","defusekit","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon","fuelF"]]};
		};
	};
	case "baf_engineer": {["BAF Engineer Store",["wallYellow","wallOrange","trafficCone","barGate","arrowleft","arrowright","floodLightSingle","floodLightDouble","fuelF","lockpick"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","bottledbeer","moonshine"]]};
	case "organ": {["Organ Dealer",["kidney","scalpel","handCuffKey"]]}; 
	case "prospector": {["Gold Scrap Dealer",["goldbarp"]]};
	case "crafting": {["Crafting Store",["408Bullet","408Case","45Bullet","45Case","556Bullet","556Case","65Bullet","65Case","762Bullet","762Case","9mmBullet","9mmCase","chamber","electric","explosive","glasslens","gunpowder","handgrip","heavythread","leather","metalcase","metalplate","needle","primer","steeltube","thread","trigger","zipper"]]};
	case "bh": {["Bounter Hunter Item Shop",["blindfold","fuelF","lockpick","rabbit","tbacon","tent","water","zipties"]]};
	case "c3": {["Class 3 Item Shop",[""]]};
};