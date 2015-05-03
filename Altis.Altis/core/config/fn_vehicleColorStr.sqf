/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Black"};
			case 7: {_color = "Police"};
			case 8: {_color = "Taxi"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
			case 8: {_color = "Police"};
      case 9: {_color = "Black / Red / White"};
      case 10: {_color = "Blue / White"};
      case 11: {_color = "Red Bull"};
      case 12: {_color = "Volkswagen"};
      case 13: {_color = "HATO"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Police (RCU only)"};
      case 7: {_color = "Unmarked (RCU only)"};
      case 8: {_color = "Abu Dhabi"};
      case 9: {_color = "Monster"};
      case 10: {_color = "Porsche"};
      case 11: {_color = "Paramedic"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Unmarked (RCU only)";};
			case 2: {_color = "Silver";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Police";};
			case 5: {_color = "Paramedic"};
      case 6: {_color = "ANPR Interceptor (RCU only)"};
      case 7: {_color = "Black"};
      case 8: {_color = "Black / White"};
      case 9: {_color = "Blue / White"};
      case 10: {_color = "Blue / White / Yellow"};
      case 11: {_color = "Don't Do Drugs"};
      case 12: {_color = "Green"};
      case 13: {_color = "Jurassic Park"};
      case 14: {_color = "North Korea"};
      case 15: {_color = "Orange / White"};
      case 16: {_color = "Red"};
      case 17: {_color = "Red / Black"};
      case 18: {_color = "White"};
      case 19: {_color = "Yellow"};
      case 20: {_color = "HATO"};
	  case 21: {_color = "Military Police"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "Ambulance"};
      case 3: {_color = "Police"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "HATO"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "BAF Camo"};
		};
	};
    
    case "B_Heli_Light_01_armed_F":
	{
		switch (_index) do
		{
            case 0: {_color = "BAF Camo"};
        };
    };
    
    case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
            case 0: {_color = "BAF Camo"};
        };
    };
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
            case 0: {_color = "BAF Camo"};
        };
    };
    
    //"ARMED" Ghost Hawk
    case "B_Heli_Transport_01_camo_F":
	{
		switch (_index) do
		{
            case 0: {_color = "BAF Camo"};
        };
    };
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "EMS White"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Paramedic"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
            case 1: {_color = "BAF Camo"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
            case 0: {_color = "BAF Camo"};
		};
	};
    
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel"};
		};
	};
    
    case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel"};
		};
	};
	
	
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
      case 2: {_color = "OSU"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
			case 2: {_color = "HATO"};
		};
	};
	
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "BAF Camo"};
			case 1: {_color = "Black"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
    
    case "B_Heli_Transport_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Default"};
			case 1: {_color = "BAF Camo"};
		};
	};
    
    case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Default"};
			case 1: {_color = "BAF Camo"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
  
    case "I_Heli_light_03_F":
  {
    switch (_index) do
    {
      case 0: {_color = "BAF Camo"};
    };
  };
  
  case "I_Heli_light_03_unarmed_F":
  {
    switch (_index) do
    {
      case 0: {_color = "Default"};
      case 1: {_color = "India 99"};
      case 2: {_color = "BAF Camo"};
    };
  };
  
  case "B_G_Offroad_01_repair_F":
  {
    switch (_index) do
    {
      case 0: {_color = "HATO"};
    };
  };
  
  case "B_UGV_01_F":
  {
    switch (_index) do
    {
      case 0: {_color = "HATO"};
    };
  };
  
  case "I_Truck_02_box_F":
  {
    switch (_index) do
    {
	  case 0: {_color = "Police"};
      case 1: {_color = "HATO"};
      case 2: {_color = "Green Camo"};
    };
  };
  
  case "B_G_Van_01_transport_F":
  {
    switch (_index) do
    {
      case 0: {_color = "HATO"};
    };
  };
};

_color;