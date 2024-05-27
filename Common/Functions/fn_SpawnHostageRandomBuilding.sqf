/*
  # HEADER #
	Script: 		Common\Functions\fn_SpawnHostageRandomBuilding.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créée des otages aléatoire avec un spawn aléatoire à l'intérieur des bâtiments les plus proches du marqueur.
          Les hostages seront captifs et pourront être libéré pour être excorté. 
          
          EN = The function allows you to create random hostages with a random spawn inside the buildings closest to the marker.
          The hostages will be captive and may be released for excortion.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	27-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create
  1	[String]: number of hostages created
  2	[String]: name marker
  3	[String]: distance radius
  

  # RETURNED VALUE #

  # SYNTAX #
	[VARIABLE, VARIABLE, VARIABLE, VARIABLE] spawn POPO_fnc_SpawnRandomHostageBuilding;

  # DEPENDENCIES # 
  spawn POPO_fnc_Loop;
  call POPO_fnc_FreeHostage;
  call POPO_fnc_StopEscortHostage;
  call POPO_fnc_StopEscort;
  call POPO_fnc_3Dsound;

  # EXAMPLE # 
  [unit, number unit, getPosition marker, distance radius marker] spawn POPO_fnc_SpawnRandomHostageBuilding;
  [Hostage, 5, marker_0, 100] spawn POPO_fnc_SpawnRandomHostageBuilding;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random à l'intérieur de bâtiment avec les options 
params ["_TypeHostage","_numberHostages","_nameMarker","_distanceRadius"];
for "_i" from 0 to _numberHostages do // a loop repeating X times
{
    _buildings = nearestObjects [(getMarkerPos _nameMarker), ["house"], _distanceRadius];
    _building = selectRandom _buildings;
    _damageHostage = selectRandom Random_Damage;
    _buildingPositions = [_building] call BIS_fnc_buildingPositions;
    _side_grp_hostage = createGroup civilian;
    private _HostageCreated = _side_grp_hostage createUnit [(selectRandom _TypeHostage), (selectRandom _buildingPositions), [], 0, "NONE"]; 
    _HostageCreated switchmove "Acts_AidlPsitMstpSsurWnonDnon03";
    {_HostageCreated DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
    _HostageCreated setDamage _damageHostage;
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_Escort","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_STOP_Escort","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_stop_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_stop_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_StopEscortHostage},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_FREE_Hostage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_FreeHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};
    [alive _HostageCreated, "Sound\ausecoursjesuisretenuici.ogg", _HostageCreated, 5] spawn POPO_fnc_Loop;
    sleep 0.25;
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};
true

