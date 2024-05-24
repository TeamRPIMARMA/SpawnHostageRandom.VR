/*
  # HEADER #
	Script: 		Common\Functions\Common_fnc_EscortHostage.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet l'escort de l'otage. 
          
          EN = The function allows the escort of the hostage.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	16-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create

  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[VARIABLE] call POPO_Common_fnc_EscortHostage;
  [VARIABLE] call POPO_Common_fnc_StopEscort;

  # DEPENDENCIES #

  # EXAMPLE #

    if (alive _HostageCreated && hasInterface && not isServer) then {
      [
        _HostageCreated,
        "Escorter",
        "HoldActionsPAA\holdAction_run_ca.paa",
        "HoldActionsPAA\holdAction_run_ca.paa",
        "player distance _target < 6",
        "player distance _target < 6",
        {},
        {},
        {_this call POPO_Common_fnc_EscortHostage},
        {},
        [],
        3,
        6,
        false,
        false
      ] call BIS_fnc_holdActionAdd;
    };

    if (alive _HostageCreated && hasInterface && not isServer) then {
      [
        _HostageCreated,
        "Arrêter l'escort",
        "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "player distance _target < 6",
        "player distance _target < 6",
        {},
        {},
        {_this call POPO_Common_fnc_StopEscort},
        {},
        [],
        1,
        5,
        false,
        false
      ] call BIS_fnc_holdActionAdd;
    };
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction qui stop l'escort
POPO_Common_fnc_StopEscort = {
  params ["_Hostage"];
	detach _Hostage;
  true
};
// Fonction qui escort l'otage
POPO_Common_fnc_EscortHostage = {
  params ["_Hostage"];
	_Hostage attachTo [player , [0, -1, 0]]; 
	_Hostage addVest "V_EOD_olive_F"; // V_Press_F
  {_Hostage enableAI _x} forEach ["FSM", "AUTOTARGET","TARGET", "MOVE"];
	[_Hostage] join (group player); 
  _Hostage doFollow (leader group player);
  true
};