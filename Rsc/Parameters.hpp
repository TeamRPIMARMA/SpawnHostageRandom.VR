class Params {
	// can be 0 (sunny), 25, 50, 75 or 100 (storm))
	#define WEATHER_DEFAULT		0
	#include "\a3\functions_f\Params\paramWeather.hpp"
	#define DAYTIMEHOUR_DEFAULT 12
	#include "\a3\functions_f\Params\paramDaytimeHour.hpp"

	class CTI_POPO_SpawnRandomHostage_ENABLED {
		title = $STR_CTI_POPO_SpawnRandomHostage_ENABLED;
		values[] = {-1,0,1,4,9,14,19,24,29};
		texts[] = { $STR_CTI_DISABLED, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_1, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_2, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_5, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_10, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_15, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_20, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_25, $STR_CTI_POPO_SpawnRandomHostage_ENABLED_30};
		default = 1;
	};
	class CTI_POPO_Debug_ENABLE {
	title = $STR_CTI_POPO_Debug_ENABLE;
	values[]={0,1};
	texts[]={ $STR_CTI_DISABLED, $STR_CTI_ENABLED};
	default = 0;
	};
};
