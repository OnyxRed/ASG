#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",3000],
			["C_Kart_01_Fuel_F",3000],
			["C_Kart_01_Red_F",3000],
			["C_Kart_01_Vrana_F",3000]
		];
	};
	case "med_shop":
	{
		_return = 
		[
			["C_SUV_01_F",20000],
      ["C_Van_01_box_F",20000]
    ];
    if (__GETC__(life_medicLevel) > 1) then {
      _return pushBack
      ["C_Hatchback_01_sport_F",30000];
    };
	};
	
	case "med_air_hs": {
    if (__GETC__(life_medicLevel) > 2) then {
      _return = [
        ["O_Heli_Light_02_unarmed_F",75000]
      ];
    };
	};
	
	case "reb_air":
	{
		if(license_civ_rebel) then
		{
			_return pushBack
			["C_Heli_Light_01_civil_F",100000];
			_return pushBack
			["B_Heli_Light_01_F",150000];
			_return pushBack
			["O_Heli_Light_02_unarmed_F",400000];
			_return pushback
			["O_Heli_Transport_04_bench_F",450000];
		};
		
		if (__GETC__(life_donator) == 1) then {
			_return set[count _return,["C_Heli_Light_01_civil_F",90000]];
			_return set[count _return,["B_Heli_Light_01_F",135000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",360000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",405000]];
		};
		
		if (__GETC__(life_donator) == 2) then {
			_return set[count _return,["C_Heli_Light_01_civil_F",75000]];
			_return set[count _return,["B_Heli_Light_01_F",112500]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",300000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",337500]];
		};
		
		if (__GETC__(life_donator) == 3) then {
			_return set[count _return,["C_Heli_Light_01_civil_F",60000]];
			_return set[count _return,["B_Heli_Light_01_F",90000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",240000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",270000]];
		};
	};
	
	case "civ_car":
	{
		_return = [
			["C_Hatchback_01_F",14000],
			["C_Offroad_01_F",18000],
			["C_SUV_01_F",24000],
			["C_Van_01_transport_F",48000],
			["C_Hatchback_01_sport_F",98000],
			["C_Quadbike_01_F",2500]
		];
		if(__GETC__(life_donator) == 0) then
		{
			_return set[count _return,["C_Hatchback_01_F",14000]];
			_return set[count _return,["C_Offroad_01_F",18000]];
			_return set[count _return,["C_SUV_01_F",24000]];
			_return set[count _return,["C_Van_01_transport_F",48000]];
			_return set[count _return,["C_Hatchback_01_sport_F",98000]];
			_return set[count _return,["C_Quadbike_01_F",2500]];
			
		};
		
		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["C_Hatchback_01_F",12600]];
			_return set[count _return,["C_Offroad_01_F",12600]];
			_return set[count _return,["C_SUV_01_F",21600]];
			_return set[count _return,["C_Van_01_transport_F",43200]];
			_return set[count _return,["C_Hatchback_01_sport_F",88200]];
			_return set[count _return,["C_Quadbike_01_F",2500]];
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["C_Hatchback_01_F",10500]];
			_return set[count _return,["C_Offroad_01_F",13500]];
			_return set[count _return,["C_SUV_01_F",18000]];
			_return set[count _return,["C_Van_01_transport_F",36000]];
			_return set[count _return,["C_Hatchback_01_sport_F",79500]];
			_return set[count _return,["C_Quadbike_01_F",2500]];
		};
		
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["C_Hatchback_01_F",8400]];
			_return set[count _return,["C_Offroad_01_F",10800]];
			_return set[count _return,["C_SUV_01_F",14400]];
			_return set[count _return,["C_Van_01_transport_F",28800]];
			_return set[count _return,["C_Hatchback_01_sport_F",58800]];
			_return set[count _return,["C_Quadbike_01_F",2500]];
		};
	};
	
	case "civ_truck":
	{
		_return = [
		["C_Van_01_box_F",58000],
		["I_Truck_02_covered_F",130000],
		["B_Truck_01_box_F",180000],
		["B_Truck_01_repair_F",240000],
		["O_Truck_03_device_F",6000000],
		["C_Van_01_Fuel_F",15000]		
	    ];
		if(__GETC__(life_donator) == 0) then
		{
			_return set[count _return,["C_Van_01_box_F",58000]];
			_return set[count _return,["I_Truck_02_covered_F",130000]];
			_return set[count _return,["B_Truck_01_box_F",180000]];
			_return set[count _return,["B_Truck_01_repair_F",240000]];
			_return set[count _return,["O_Truck_03_device_F",6000000]];
			_return set[count _return,["C_Van_01_Fuel_F",15000]];
		};
		
		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["C_Van_01_box_F",52200]];
			_return set[count _return,["I_Truck_02_covered_F",117000]];
			_return set[count _return,["B_Truck_01_box_F",162000]];
			_return set[count _return,["B_Truck_01_repair_F",216000]];
			_return set[count _return,["O_Truck_03_device_F",5400000]];
			_return set[count _return,["C_Van_01_Fuel_F",13500]];
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["C_Van_01_box_F",43500]];
			_return set[count _return,["I_Truck_02_covered_F",97500]];
			_return set[count _return,["B_Truck_01_box_F",135000]];
			_return set[count _return,["B_Truck_01_repair_F",180000]];
			_return set[count _return,["O_Truck_03_device_F",4500000]];
			_return set[count _return,["C_Van_01_Fuel_F",11250]];
		};
		
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["C_Van_01_box_F",34800]];
			_return set[count _return,["I_Truck_02_covered_F",78000]];
			_return set[count _return,["B_Truck_01_box_F",108000]];
			_return set[count _return,["B_Truck_01_repair_F",144000]];
			_return set[count _return,["O_Truck_03_device_F",3600000]];
			_return set[count _return,["C_Van_01_Fuel_F",9000]];
		};
	};
	
	case "gang_car":
	{
		_return = [
			["B_G_Offroad_01_F",20000],
			["O_G_Offroad_01_armed_F",900000],
			["O_MRAP_02_F",1100000],
			["I_MRAP_03_F",1300000]
			
		];
	};
	
	case "pmc_car":
	{
		_return = [
			["B_G_Offroad_01_F",19000],
			["O_G_Offroad_01_armed_F",850000],
			["O_MRAP_02_F",1000000],
			["I_MRAP_03_F",1250000]
			
		];
	};
	
	case "BH_car":
	{
        if(license_civ_bh) then {
            _return = [
                ["C_Hatchback_01_F",50000],
//                ["B_MRAP_01_F",600000],
//                ["O_MRAP_02_F",600000],
//                ["I_MRAP_03_F",600000],
                ["B_G_Offroad_01_F",45000],
                ["C_SUV_01_F",37000]
                
            ];
        };
	};
	
	case "reb_car":
	{
		if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_F",20000];
			_return pushBack
			["O_G_Offroad_01_armed_F",900000];
			_return pushBack
			["O_MRAP_02_F",1100000];
			_return pushBack
			["I_MRAP_03_F",1300000];
		};
		
		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["O_MRAP_02_F",990000]];
			_return set[count _return,["I_MRAP_03_F",1170000]];
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["O_MRAP_02_F",825000]];
			_return set[count _return,["I_MRAP_03_F",975000]];
		};
		
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["O_MRAP_02_F",660000]];
			_return set[count _return,["I_MRAP_03_F",780000]];
		};
	};
	
	case "donator_vehicles":
	{
		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["C_Hatchback_01_F",12600]];
			_return set[count _return,["C_Hatchback_01_sport_F",88200]];
			_return set[count _return,["C_Offroad_01_F",16200]];
			_return set[count _return,["C_SUV_01_F",21600]];
			_return set[count _return,["C_Van_01_Fuel_F",13500]];
			_return set[count _return,["C_Van_01_box_F",43200]];
			_return set[count _return,["B_Truck_01_box_F",162000]];
			_return set[count _return,["O_Truck_03_device_F",5400000]];
			_return set[count _return,["C_Heli_Light_01_civil_F",90000]];
			_return set[count _return,["B_Heli_Light_01_F",135000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",360000]];
			_return set[count _return,["I_Heli_Transport_02_F",900000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",405000]];
			_return set[count _return,["O_Heli_Transport_04_box_F",585000]];
			_return set[count _return,["O_Heli_Transport_04_covered_F",405000]];
		    _return set[count _return,["I_Heli_light_03_unarmed_F",607500]];
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",675000]];
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["C_Hatchback_01_F",10500]];
			_return set[count _return,["C_Hatchback_01_sport_F",73500]];
			_return set[count _return,["C_Offroad_01_F",13500]];
			_return set[count _return,["C_SUV_01_F",18000]];
			_return set[count _return,["C_Van_01_Fuel_F",11250]];
			_return set[count _return,["C_Van_01_box_F",36000]];
			_return set[count _return,["B_Truck_01_box_F",135000]];
			_return set[count _return,["O_Truck_03_device_F",4500000]];
			_return set[count _return,["C_Heli_Light_01_civil_F",75000]];
			_return set[count _return,["B_Heli_Light_01_F",112500]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",300000]];
			_return set[count _return,["I_Heli_Transport_02_F",750000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",337500]];
			_return set[count _return,["O_Heli_Transport_04_box_F",487500]];
			_return set[count _return,["O_Heli_Transport_04_covered_F",337500]];
		    _return set[count _return,["I_Heli_light_03_unarmed_F",506250]];
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",562500]];
		};
		
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["C_Hatchback_01_F",8400]];
			_return set[count _return,["C_Hatchback_01_sport_F",58800]];
			_return set[count _return,["C_Offroad_01_F",10800]];
			_return set[count _return,["C_SUV_01_F",14400]];
			_return set[count _return,["C_Van_01_Fuel_F",9000]];
			_return set[count _return,["C_Van_01_box_F",28800]];
			_return set[count _return,["B_Truck_01_box_F",108000]];
			_return set[count _return,["O_Truck_03_device_F",3600000]];
			_return set[count _return,["C_Heli_Light_01_civil_F",60000]];
			_return set[count _return,["B_Heli_Light_01_F",90000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",240000]];
			_return set[count _return,["I_Heli_Transport_02_F",600000]];
			_return set[count _return,["O_Heli_Transport_04_bench_F",270000]];
			_return set[count _return,["O_Heli_Transport_04_box_F",390000]];
			_return set[count _return,["O_Heli_Transport_04_covered_F",270000]];
		    _return set[count _return,["I_Heli_light_03_unarmed_F",450000]];
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",405000]];
		};
	};
	
	case "cop_car":
	{
		if (__GETC__(life_coplevel) < 12) then {
			_return pushBack
			["C_Hatchback_01_F",6000];
			if (__GETC__(life_coplevel) > 2) then{
			  _return pushBack
			  ["C_SUV_01_F",23500];
			};
				if (__GETC__(life_coplevel) > 5) then{
			  _return pushBack
			  ["C_Offroad_01_F",12000];
		  _return pushBack
		  ["C_Van_01_box_F",35000];
			};
				if(__GETC__(life_coplevel) > 6) then{
					_return pushBack
					["C_Hatchback_01_sport_F",90000];
			  _return pushBack
			  ["B_MRAP_01_F",750000];
			  _return pushBack
			  ["I_Truck_02_covered_F",500000];
				};
		};
		if (__GETC__(life_coplevel) == 12) then{
		  _return pushBack
		  ["B_G_Offroad_01_repair_F",30000];
		  _return pushBack
		  ["B_UGV_01_F",30000];
		  _return pushBack
		  ["I_Truck_02_box_F",30000];
		  _return pushBack
		  ["C_SUV_01_F",23500];
		  _return pushBack
		  ["B_G_Van_01_transport_F",30000];
		  _return pushBack
		  ["B_UAV_02_F",30000];
		  _return pushBack
		  ["C_Van_01_Fuel_F",30000];
		};
	};
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",150000],
			["C_Heli_Light_01_civil_F",100000],
			["O_Heli_Light_02_unarmed_F",400000],
			["I_Heli_Transport_02_F",1000000],
			["B_Heli_Transport_03_unarmed_F",750000]

		];
	};
	
	case "cop_air":
	{
	if (__GETC__(life_coplevel) < 13) then {
		if (__GETC__(life_coplevel) > 3) then{
		  _return pushBack
		  ["O_Heli_Light_02_unarmed_F",100000];
			_return pushBack
		  ["B_Heli_Light_01_F",75000];
			_return pushBack
		  ["I_Heli_light_03_unarmed_F",800000];
		};
			if (__GETC__(life_coplevel) > 5) then{
		  _return pushBack
		  ["B_Heli_Transport_03_unarmed_F",700000];
		  _return pushBack
		  ["O_Heli_Transport_04_bench_F",750000];
			};
		};
	};
    
    case "baf_car":
	{
        if (__GETC__(life_coplevel) == 13) then{
            _return =
            [
                ["B_MRAP_01_F",1000,true,true]
            ];
			if(license_baf_mpolice) then {
                _return pushBack ["C_SUV_01_F",1000,true,true];
            };
            if(license_baf_armour) then {
                _return pushBack ["B_MRAP_01_hmg_F",2000,true,true];
            };
			if(license_baf_engineer) then {
                _return pushBack ["B_Truck_01_transport_F",1000,true,true];
            };
        };
    };
    
    case "baf_air":
    {
        if (__GETC__(life_coplevel) == 13) then{
                _return pushBack ["B_Heli_Light_01_F",2000,true,true];
                _return pushBack ["I_Heli_light_03_unarmed_F",2000,true,true];
                _return pushBack ["B_Heli_Transport_01_F",2000,true,true];
                _return pushBack ["B_Heli_Transport_03_unarmed_F",2000,true,true];
            if(license_baf_aircorp_armed) then {
                _return pushBack ["B_Heli_Light_01_armed_F",3000,true,true];
                _return pushBack ["I_Heli_light_03_F",3000,true,true];
                _return pushBack ["B_Heli_Transport_01_camo_F",3000,true,true];
            };
        };
    };
	
	
	case "donator_air":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
			
			case (__GETC__(life_donator) == 1):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",750000];
				_return pushBack
				["C_Heli_Light_01_civil_F",275000];
				_return pushBack
				["I_Heli_Transport_02_F",500000];
				_return pushBack
				["O_Heli_Transport_04_F",1400000];
				_return pushBack
				["O_Heli_Transport_04_box_F",2500000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",2000000];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				_return pushBack
				["B_Heli_Light_01_F",187500];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",562500];
				_return pushBack
				["C_Heli_Light_01_civil_F",206250];
				_return pushBack
				["I_Heli_Transport_02_F",375000];
				_return pushBack
				["O_Heli_Transport_04_F",1050000];
				_return pushBack
				["O_Heli_Transport_04_box_F",1875000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",1500000];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				_return pushBack
				["B_Heli_Light_01_F",125000];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",375000];
				_return pushBack
				["C_Heli_Light_01_civil_F",137500];
				_return pushBack
				["I_Heli_Transport_02_F",250000];
				_return pushBack
				["O_Heli_Transport_04_F",700000];
				_return pushBack
				["O_Heli_Transport_04_box_F",1250000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",1000000];
			};
		};
	};
	
	case "cop_airhq":
	{
		_return =
		[
			["I_Heli_light_03_unarmed_F",100000],
			["O_Heli_Light_02_unarmed_F",100000],
			["C_Heli_Light_01_civil_F",275000]
    ];
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",33000],
			["I_SDV_01_F",55000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
      ["B_Lifeboat",3000],
			["C_Boat_Civil_01_police_F",20000],
      ["C_Boat_Civil_01_rescue_F",20000],
			["B_Boat_Armed_01_minigun_F",75000]
		];
	};
};

_return;
