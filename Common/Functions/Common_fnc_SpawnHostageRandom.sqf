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
	Revision Date:	16-05-2024
	
  # PARAMETERS #
  0	[String]: The type of hostage to create
  1	[String]: The 2D/3D position where the unit should be created at

  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[VARIABLE, VARIABLE] call POPO_fnc_SpawnRandomHostages;

  # DEPENDENCIES #

  # EXAMPLE #
  in init.sqf : 
  list Hostage =  ["C_Man_Paramedic_01_F","C_man_polo_4_F","C_man_sport_3_F","C_Man_formal_2_F","C_Man_casual_6_v2_F_tanoan","C_Man_casual_1_F_tanoan","C_Man_formal_1_F_tanoan","C_scientist_F","C_Man_Fisherman_01_F","C_Man_ConstructionWorker_01_Vrana_F","C_Man_ConstructionWorker_01_Black_F","C_Man_UtilityWorker_01_F","C_Journalist_01_War_F","C_journalist_F"];
  List Spawn_Hostage =  [Spawn_Hostage_1,Spawn_Hostage_2,Spawn_Hostage_3];
	                
  [Return a "C_man_polo_4_F",Return a "Land_Garbage_square3_F"] call POPO_fnc_SpawnRandomHostages;
	-> Create a "C_man_1" at the position of "Land_Garbage_square3_F";
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random avec les options 
POPO_fnc_SpawnRandomHostages = {
    params ["_TypeHostage","_TypeSpawn_Hostage"];
        _Hostage = selectRandom _TypeHostage;// call BIS_fnc_selectRandom;
        _Spawn_Hostage = selectRandom _TypeSpawn_Hostage;// call BIS_fnc_selectRandom;
        //hint str [_Spawn_Hostage]; // DEBUG Retourne le choix du random
        _DirHostage = getDir _Spawn_Hostage;
        _side_grp_hostage = createGroup Civilian;
        private _HostageCreated = _side_grp_hostage createUnit [_Hostage, _Spawn_Hostage, [], 0, "NONE"];
        _HostageCreated setDir _DirHostage;
        _HostageCreated switchmove "Acts_AidlPsitMstpSsurWnonDnon03";
        {_HostageCreated DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
        if (alive _HostageCreated /*&& hasInterface && not isServer*/) then {[_HostageCreated,"Escorter","HoldActionsPAA\holdAction_run_ca.paa","HoldActionsPAA\holdAction_run_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated /*&& hasInterface && not isServer*/) then {[_HostageCreated,"Arrêter l'escort","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_StopEscort},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
        if (alive _HostageCreated /*&& hasInterface && not isServer*/) then {[_HostageCreated,"Détacher l'otage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_DetachHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};
};