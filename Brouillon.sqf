#define animation "Acts_AidlPsitMstpSsurWnonDnon03"

otage switchmove animation;
{otage DisableAI _x} forEach ["FSM", "AUTOTARGET","TARGET","MOVE"];
if (alive otage && hasInterface) then {[otage,"Escorter","HoldActionsPAA\holdAction_run_ca.paa","HoldActionsPAA\holdAction_run_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_EscortHostage},{},[],3,6,false,false] call BIS_fnc_holdActionAdd;};
if (alive otage && hasInterface) then {[otage,"Arrêter l'escort","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_StopEscort},{},[],1,5,false,false] call BIS_fnc_holdActionAdd;};
if (alive otage && hasInterface) then {[otage,"Détacher l'otage","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa","player distance _target < 6","player distance _target < 6",{},{},{_this call POPO_fnc_DetachHostage},{},[],1,7,true,false] call BIS_fnc_holdActionAdd;};

etatdelotage = true;
while {alive otage && etatdelotage /*== animation*/} do  
{ 
    ["Sound\paricijesuisla.ogg", otage] call POPO_fnc_3Dsound;
    sleep 10;
    ["Sound\ausecoursjesuisretenuici.ogg", otage] call POPO_fnc_3Dsound;
    sleep 10; 
};

//if (animationstate _Hostage == "Acts_AidlPsitMstpSsurWnonDnon03") exitWith {false};