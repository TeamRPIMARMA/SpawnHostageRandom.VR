/*
  # HEADER #
	Script: 		Common\Functions\Common_fnc_FreeHostage.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de libéré l'otage. 
          
          EN = The function allows you to free the hostage.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	16-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create

  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[VARIABLE] call POPO_fnc_DetachHostage;

  # DEPENDENCIES #

  # EXAMPLE #
  if (alive _HostageCreated && hasInterface && not isServer) then {
      [
        _HostageCreated,
        "Détacher l'otage",
        "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "player distance _target < 6",
        "player distance _target < 6",
        {},
        {},
        {_this call POPO_fnc_DetachHostage},
        {},
        [],
        1,
        7,
        true,
        false
      ] call BIS_fnc_holdActionAdd;
    };
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction qui libère l'otage
POPO_fnc_DetachHostage = {
  params ["_Hostage"];
	_Hostage playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";
  ["Sound\SonDetachHostage.ogg", _Hostage] call POPO_fnc_3Dsound;
};