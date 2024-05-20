/*
  # HEADER #
	Script: 		Common\Functions\POPO_fnc_SpawnHostageRandom.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créée des otages aléatoire avec un spawn aléatoire.
          Les hostages seront captifs et pourront être libéré pour être excorté. 
          
          EN = The function allows you to create random hostages with a random spawn.
          The hostages will be captive and may be released for excortion.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	18-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create
  1	[String]: The 2D/3D position as well as its direction where the unit must be created at
  2	[String]: number of hostages created

  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[VARIABLE, VARIABLE, VARIABLE] call POPO_fnc_SpawnRandomHostages;

  # DEPENDENCIES #

  # EXAMPLE #
  in init.sqf : 
  [Hostage,Random_Spawn_Hostage,9] call POPO_fnc_SpawnRandomHostages;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random avec les options 
POPO_fnc_SpawnRandomHostages = {
    params ["_TypeHostage","_TypeSpawn_Hostage","_numberHostages"];
    for "_i" from 0 to _numberHostages do // a loop repeating X times
    {
        _Hostage = selectRandom _TypeHostage;// call BIS_fnc_selectRandom;
        _Spawn_Hostage = selectRandom _TypeSpawn_Hostage;// call BIS_fnc_selectRandom;
        _DirHostage = getDir _Spawn_Hostage;
        _side_grp_hostage = createGroup civilian;
        private _HostageCreated = _side_grp_hostage createUnit [_Hostage, _Spawn_Hostage, [], 0, "NONE"];
        Random_Spawn_Hostage deleteAt (Random_Spawn_Hostage find _Spawn_Hostage);
        //hint str [Random_Spawn_Hostage]; // DEBUG Retourne le choix du random
        _HostageCreated setDir _DirHostage;
        _HostageCreated switchmove "Acts_AidlPsitMstpSsurWnonDnon03";
        {_HostageCreated DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Escorter","HoldActionsPAA\holdAction_run_ca.paa","HoldActionsPAA\holdAction_run_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Arrêter l'escort","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_StopEscort},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated && hasInterface) then {[_HostageCreated,"Détacher l'otage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_DetachHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};
        [alive _HostageCreated, "Sound\ausecoursjesuisretenuici.ogg","Sound\paricijesuisla.ogg", _HostageCreated, 10] spawn POPO_Common_fnc_Loop; // Pour plus tard rajouter l'animation de la bouche qui bouge pendant qu'il parle
        sleep 1;
    };
};

