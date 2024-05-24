/*
  # HEADER #
	Script: 		Common\Functions\POPO_fnc_SpawnHostageRandomBuilding.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créée des otages aléatoire avec un spawn aléatoire à l'intérieur des bâtiments les plus proches du marqueur.
          Les hostages seront captifs et pourront être libéré pour être excorté. 
          
          EN = The function allows you to create random hostages with a random spawn inside the buildings closest to the marker.
          The hostages will be captive and may be released for excortion.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	24-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create
  1	[String]: number of hostages created
  2	[String]: name marker
  3	[String]: distance radius
  

  # RETURNED VALUE #

  # SYNTAX #
	[VARIABLE, VARIABLE, VARIABLE, VARIABLE] spawn POPO_Common_fnc_SpawnRandomHostagesBuilding;

  # DEPENDENCIES # 
  spawn POPO_Common_fnc_Loop;
  call POPO_Common_fnc_DetachHostage;
  call POPO_Common_fnc_EscortHostage;
  call POPO_Common_fnc_StopEscort;
  call POPO_Common_fnc_3Dsound;

  # EXAMPLE # 
  [unit, number unit, getPosition marker, distance radius marker] spawn POPO_Common_fnc_SpawnRandomHostagesBuilding;
  [Hostage, 5, marker_0, 100] spawn POPO_Common_fnc_SpawnRandomHostagesBuilding;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random à l'intérieur de bâtiment avec les options 
POPO_Common_fnc_SpawnRandomHostagesBuilding = {
    params ["_TypeHostage","_numberHostages","_nameMarker","_distanceRadius"];
    for "_i" from 0 to _numberHostages do // a loop repeating X times
    {
        _buildings = nearestObjects [(getMarkerPos _nameMarker), ["house"], _distanceRadius];
        _building = selectRandom _buildings;
        _buildingPositions = [_building] call BIS_fnc_buildingPositions;
        _side_grp_hostage = createGroup [civilian, true];
        _HostageCreated = _side_grp_hostage createUnit [(selectRandom _TypeHostage), (selectRandom _buildingPositions), [], 0, "NONE"]; 
        _HostageCreated switchmove "Acts_AidlPsitMstpSsurWnonDnon03";
        {_HostageCreated DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Escorter","HoldActionsPAA\holdAction_run_ca.paa","HoldActionsPAA\holdAction_run_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_Common_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Arrêter l'escort","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_Common_fnc_StopEscort},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Détacher l'otage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_Common_fnc_DetachHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};
        [alive _HostageCreated, "Sound\ausecoursjesuisretenuici.ogg", _HostageCreated, 5] spawn POPO_Common_fnc_Loop;
        sleep 2.5;
    };
    true
};

