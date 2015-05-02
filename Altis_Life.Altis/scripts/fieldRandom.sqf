/*
	Description: Cycles the locations of the drug fields between 4 pre 
					defined locations you know to mix things up a bit
Based of a script made for army storm gaming 

*/
cokeFeilds = ["dmcoke1","dmcoke2","dmcoke3","dmcoke4"];
heroinFeilds = ["dmheroin1","dmheroin2","dmheroin3","dmheroin4"];
weedFeilds = ["dmweed1","dmweed2","dmweed3","dmweed4"];
DrugDealer = ["dealer1","dealer2","dealer3","dealer4","dealer5"];

if (!isServer) exitWith {};

while {true} do 
{
	// load Coke Fields
	_sCount = count cokeFeilds;
	for "_x" from 0 to 1 do 
	{
		_sSelect = floor(random _sCount);
		_item = cokeFeilds select _sSelect;
		"coke_area_1" setMarkerPos getMarkerPos _item;
		"cocaine_1" setMarkerPos getMarkerPos _item;
	};

	// load Heroin Fields
	_sCount = count heroinFeilds;
	for "_x" from 0 to 1 do 
	{
		_sSelect = floor(random _sCount);
		_item = heroinFeilds select _sSelect;
		"heroin_area_1" setMarkerPos getMarkerPos _item;
		"heroin_1" setMarkerPos getMarkerPos _item;
	};

	// load Weed Feilds
	_sCount = count heroinFeilds;
	for "_x" from 0 to 1 do 
	{
		_sSelect = floor(random _sCount);
		_item = weedFeilds select _sSelect;
		"weed_" setMarkerPos getMarkerPos _item;
		"weed_1" setMarkerPos getMarkerPos _item;
	};	
	
	// load Drug Dealer
	_sCount = count DrugDealer;
	for "_x" from 0 to 1 do 
	{
		_sSelect = floor(random _sCount);
		_item = DrugDealer select _sSelect;
    _dealer = missionNamespace getVariable "Dealer_3";
		_dealer setPos getMarkerPos _item;
		"Dealer_1_3" setMarkerPos getMarkerPos _item;
	};
	
	sleep 6366;
};