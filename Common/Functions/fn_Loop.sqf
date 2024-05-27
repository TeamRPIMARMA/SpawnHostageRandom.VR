/*
  # HEADER #
	Script: 		Common\Functions\fn_Loop.sqf
	Alias:			
	Description:			      
          <FR = Fonction qui permet de faire une boucle. 
          
          EN = Function that allows you to make a loop.
	Author: 		Popo
	Creation Date:	18-05-2024
	Revision Date:	27-05-2024
	
  # PARAMETERS #
  0	[String]: loop condition
  1	[String]:see Arma 3: Sound Files for available file names or Example 3 to use mission files;
  filename can start with a leading slash \a3\...
  2 [Object]:the object emitting the sound. If soundPosition below is specified this parameter is ignored
  3	[String]:int number for sleep
  
  # RETURNED VALUE #

  # SYNTAX #
	[Condition of loop, "Sound Files 1", sound Source, Time loop in sec] spawn POPO_fnc_Loop;


  # DEPENDENCIES #
  call POPO_fnc_3Dsound;

  # EXAMPLE #
  [alive unit, "Sound\ausecoursjesuisretenuici.ogg", Hostage, 10] spawn POPO_fnc_Loop;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction qui accroche un son 3D à l'unité en boucle avec sa condition de sortie
params ["_condition","_filename","_soundSource","_timeSleep"];
while {_condition} do 
{
  [ _filename, _soundSource] call POPO_fnc_3Dsound;
  sleep _timeSleep;
  if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint "On est dans la boucle.";};
  if (animationstate _soundSource == "Acts_AidlPsitMstpSsurWnonDnon_out") exitWith // Condition de sortie en true
  {
      if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint "On sort de la boucle.";};
  };
};
true