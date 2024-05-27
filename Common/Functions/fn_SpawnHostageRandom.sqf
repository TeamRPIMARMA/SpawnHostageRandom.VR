/*
  # HEADER #
	Script: 		Common\Functions\fn_SpawnHostageRandom.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créée des otages aléatoire avec un spawn aléatoire.
          Les hostages seront captifs et pourront être libéré pour être excorté. 
          
          EN = The function allows you to create random hostages with a random spawn.
          The hostages will be captive and may be released for excortion.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	27-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create
  1	[String]: The 2D/3D position as well as its direction where the unit must be created at
  2	[String]: number of hostages created

  # RETURNED VALUE #

  # SYNTAX #
	[VARIABLE, VARIABLE, VARIABLE] call POPO_fnc_SpawnRandomHostage;

  # DEPENDENCIES #
  spawn POPO_fnc_Loop;
  call POPO_fnc_FreeHostage;
  call POPO_fnc_StopEscortHostage;
  call POPO_fnc_EscortHostage;
  call POPO_fnc_3Dsound;

  # EXAMPLE #
  [Hostage,Random_Spawn_Hostage,9] call POPO_fnc_SpawnRandomHostage;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random avec les options 
params ["_TypeHostage","_TypeSpawn_Hostage","_numberHostages"];
for "_i" from 0 to _numberHostages do // a loop repeating X times
{
    _Hostage = selectRandom _TypeHostage;
    _Spawn_Hostage = selectRandom _TypeSpawn_Hostage;
    _DirHostage = getDir _Spawn_Hostage;
    _damageHostage = selectRandom Random_Damage;
    _side_grp_hostage = createGroup civilian;
    private _HostageCreated = _side_grp_hostage createUnit [_Hostage, _Spawn_Hostage, [], 0, "NONE"];
    Random_Spawn_Hostage deleteAt (Random_Spawn_Hostage find _Spawn_Hostage);
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne le spawn choisi, %1", Random_Spawn_Hostage];};
    _HostageCreated setDir _DirHostage;
    _HostageCreated switchmove "Acts_AidlPsitMstpSsurWnonDnon03";
    _HostageCreated setDamage _damageHostage;
    {_HostageCreated DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_Escort","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_STOP_Escort","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_stop_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_stop_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_StopEscortHostage},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
    if (alive _HostageCreated && hasInterface) then {[_HostageCreated,localize "STR_CTI_POPO_FREE_Hostage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_FreeHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};
    [alive _HostageCreated, "Sound\ausecoursjesuisretenuici.ogg", _HostageCreated, 5] spawn POPO_fnc_Loop;
    sleep 0.25;
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};
true  


