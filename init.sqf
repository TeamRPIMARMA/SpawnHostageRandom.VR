//--- Common Part execution
call compile preprocessFileLineNumbers "Common\Init\Init_CommonConstants.sqf";
call compile preprocessFileLineNumbers "Common\Init\Init_Common.sqf";

//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

//--- Retrun the variable for params
if (CTI_POPO_SpawnRandomHostage_ENABLED isEqualTo CTI_POPO_SpawnRandomHostage_ENABLED) then {[Hostage,Random_Spawn_Hostage,CTI_POPO_SpawnRandomHostage_ENABLED] spawn POPO_Common_fnc_SpawnRandomHostages;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne le nombre d'otages qui vont spawn + 1, %1", CTI_POPO_SpawnRandomHostage_ENABLED];};