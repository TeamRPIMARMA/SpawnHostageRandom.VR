/*
  # HEADER #
	Script: 		Common\Functions\Common_fnc_3Dsound.sqf
	Alias:			
	Description:			      
          <FR = Fonction qui accroche un son 3D à l'unité. 
          
          EN = Function that hooks 3D sound to the unit.
	Author: 		Popo
	Creation Date:	16-05-2024
	Revision Date:	16-05-2024
	
  # PARAMETERS #
  0	[String]:see Arma 3: Sound Files for available file names or Example 3 to use mission files;
  filename can start with a leading slash \a3\...
  1 [Object]:the object emitting the sound. If soundPosition below is specified this parameter is ignored
  
  # RETURNED VALUE #

  # PARAMETERS #

  # SYNTAX #
	[filename, soundSource] call POPO_fnc_3Dsound;


  # DEPENDENCIES #

  # EXAMPLE #
  ["Sound\SonDetachHostage.ogg", _Hostage] call POPO_fnc_3Dsound;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction qui accroche un son 3D à l'unité
POPO_fnc_3Dsound = {
  params ["_filename","_soundSource"];
	playSound3D [getMissionPath _filename, _soundSource, true, _soundSource modelToWorld [0,0,0],1,1,0];	
};