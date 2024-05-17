//--- Common Part execution
call compile preprocessFileLineNumbers "Common\Init\Init_CommonConstants.sqf";
call compile preprocessFileLineNumbers "Common\Init\Init_Common.sqf";

// Qui nous donne ceci
[Hostage,Random_Spawn_Hostage_1] call POPO_fnc_SpawnRandomHostages;
[Hostage,Random_Spawn_Hostage_2] call POPO_fnc_SpawnRandomHostages;
[Hostage,Random_Spawn_Hostage_3] call POPO_fnc_SpawnRandomHostages;
[Hostage,Random_Spawn_Hostage_4] call POPO_fnc_SpawnRandomHostages;

while {alive Hostage} do {["Sound\SonDetachHostage.ogg", Hostage] call POPO_fnc_3Dsound;sleep 30;};