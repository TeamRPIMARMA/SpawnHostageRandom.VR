/*
  # HEADER #
	Script: 		Common\Functions\fn_EscortHostage.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet l'escort de l'otage. 
          
          EN = The function allows the escort of the hostage.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	27-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create

  # RETURNED VALUE #

  # SYNTAX #
  [VARIABLE] call POPO_fnc_EscortHostage;

  # DEPENDENCIES #
  [VARIABLE] call POPO_fnc_StopEscortHostage;

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
        {_this call POPO_fnc_EscortHostage},
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
        {_this call POPO_fnc_StopEscortHostage},
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
// Fonction qui escort l'otage
params ["_Hostage"];
_Hostage attachTo [player , [0, -1, 0]]; 
_Hostage addVest "V_EOD_olive_F"; // V_Press_F
{_Hostage enableAI _x} forEach ["FSM", "AUTOTARGET","TARGET", "MOVE"];
[_Hostage] join (group player); 
_Hostage doFollow (leader group player);
true
