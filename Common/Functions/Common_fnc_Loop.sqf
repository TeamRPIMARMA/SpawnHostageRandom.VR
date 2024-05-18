/*
  # HEADER #
	Script: 		Common\Functions\Common_fnc_Loop.sqf
	Alias:			
	Description:			      
          <FR = Fonction qui permet de faire une boucle. 
          
          EN = Function that allows you to make a loop.
	Author: 		Popo
	Creation Date:	18-05-2024
	Revision Date:	18-05-2024
	
  # PARAMETERS #
  0	[String]: loop condition
  1	[String]:see Arma 3: Sound Files for available file names or Example 3 to use mission files;
  filename can start with a leading slash \a3\...
  2 [Object]:the object emitting the sound. If soundPosition below is specified this parameter is ignored
  3	[String]:int number for sleep
  
  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[Condition of loop, "Sound Files", sound Source, Time loop in sec] call POPO_Common_fnc_Loop;


  # DEPENDENCIES #

  # EXAMPLE #
  [alive unit, "Sound\SonDetachHostage.ogg", Hostage, 30] call POPO_Common_fnc_Loop;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction qui accroche un son 3D à l'unité
POPO_Common_fnc_Loop = {
  params ["_condition","_filename","_soundSource","_timeSleep"];
  while {_condition} do 
  {
	[ _filename, _soundSource] call POPO_fnc_3Dsound;
  sleep _timeSleep;
  };	
};