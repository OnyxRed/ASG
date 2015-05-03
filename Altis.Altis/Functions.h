class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
		class killTent {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
		class welcomeNotificationSpecial {};
	};
	
	class Admin
	{
		file = "core\admin";
		class adminInfo {};
		class adminID {};
		class adminGetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminHeal {};
		class adminFeed {};
		class adminRestrain {};
		class adminRestrainAction {};
		class adminUnrestrain {};
		class adminUnrestrainAction {};
		class adminSeizeWeapons {};
		class adminSeizeAction {};
		class adminGrantBH {};
		class adminTeleportTo {};
		class adminCompRequest {};
		class adminImpound {};
		class adminJailPre {};
		class adminArrest {};
		class adminJailDialog {};
		class adminJail {};
		class adminInvis {};
		class adminInvisHide {};
		class adminInvisReveal {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicSiren2 {};
		class newLifeRule {};
	};
	
	class Nightclub_System
	{
		file = "core\nightclub";
		class ncFlash {};
		class ncLights {};
		class ncLightsOn {};
		class ncMusic {};
		class ncSmoke {};
		class ncTeargas {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class bombDetect {};
		class takeOrgans {};
		class robShops {};
		class rob_bank {};
		class surrender {};
		class sitDown {};
		class copCrush {};
		class stealVehicle {};
		class suicideBomb {};
		class craftAction {};
		class unzip {};
		class zipTieAction {};
		class compAction {};
		class packUpWallYellow {};
		class packUpWallOrange {};
		class packUpCone {};
		class packUpGate {};
    class houseAlarmAlert {};
    class houseAlarmSound {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class seizeCfg {};
		class craftCfg {};
		class itemIcon {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_journalist {};
		class clothing_c3 {};
		class clothing_bh {};
		class clothing_gangbase {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class wantedPlus {};
		class wantedPlusAdd {};
		class physicalPhone {};
		class jailTime {};
		class craft {};
		class craft_update {};
		class reportStolen {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class fatigueReset {};
		class emptyFuel {};
		class autoSave {};
		class restrictSlingLoad {};
		class insurance {};
		class playSound {};
		class addSubtract {};
		class equipGear {};
		class setUniform {};
		class blindfolded {};
		class lockCrate {};
		class vehTurnSignal {};
		class forceEject {};
		class ryn_message {};
		class gasStationAlarm {};
	};
	
	class Market
	{
		file = "core\market";
		class openMarketView {};
		class refreshMarketView {};
		class marketShortView {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
		class marketBuy {};
		class marketSell {};
	};
    
    class TaskForceRadio
	{
		file = "core\tfr";
		class initTFARRadioLR {};
		class initTFARRadioSW {};
		class initTFARRadioLR_veh {};
	}
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class inJail {};
		class outOfJail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class hasOrgan {};
		class waterChargeTimer {};
		class civInteractionMenu {};
		class handleDowned {};
		class freezePlayer {};
		class blindfold {};
		class blindfoldRemove {};
		class skyDive {};
		class feedPlayer {};
		class feedMe {};
		class earPlugs {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class gpsTracker {};
		class enforceVehicleLicense {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class copSiren2 {};
		class copSiren3 {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class copOpener {};
		class breathalyzer {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
		class radarCam {};
		class copHorn {};
		class revokeLicense {};
		class removeGear {};
		class removeHeadgear {};
		class removeGoggles {};
		class removeVest {};
		class removeBackpack {};
		class removeUniform {};
		class removeAllGear {};
		class breakinMarker {};
		class showArrestDialog {}; //changed
		class arrestDialog_Arrest {}; //changed
		class neutralizeHideout {};
		class HATOLights {};
		class changeArmyGear {};
	};
	
	class EMP
	{
		file = "core\emp";
		class openEmpMenu {};
		class empVehicle {};
		class isEmpOperator {};
		class scanVehicles {};
		class vehicleEmpd {};
		class warnVehicle {};
		class vehicleWarned {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
	};

	class Casino
	{
		file = "core\casino";
		class blackjack {};
		class blackjackBet {};
		class blackjackHit {};
		class blackjackStay {};
		class slotMachine {};
		class slotSpin {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class chainsawUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class demolitionCharge {};
		class bombDefuseKit {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class underWaterCharge {};
		class speedBomb {};
		class tent {};
		class jointSmoke {};
		class drugAffects {};
		class carAlarm {};
		class vehAmmo {};
		class pickupObject {};
		class placeObject {};
		class zipTie {};
		class ammoBox {};
		class handleCrate {};
		class crateMenu {};
		class wallYellow {};
		class wallOrange {};
		class trafficCone {};
		class barGate {};
    class houseAlarm {};
		class bankalarmsound {};  //Request from The Puppeteer
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class safeInvGold {};
		class safeGold {};
		class goldTake {};
	};
	
};