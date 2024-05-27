//player globalChat format ["je suis init"];

//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

//--- Retrun the variable for params
if (CTI_POPO_SpawnRandomHostage_ENABLED isEqualTo CTI_POPO_SpawnRandomHostage_ENABLED) then {[Hostage,CTI_POPO_SpawnRandomHostage_ENABLED,"hostages_marker_0", 150] spawn POPO_fnc_SpawnHostageRandomBuilding;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne le nombre d'otages qui vont spawn + 1, %1", CTI_POPO_SpawnRandomHostage_ENABLED];};
