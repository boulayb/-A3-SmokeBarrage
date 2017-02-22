class CfgPatches
{
	class rcdc_SmokeBarrage
	{
		name = "Smoke Barrage";
		author = "Redleouf";
		url = "https://github.com/boulayb/-A3-SmokeBarrage";
		authorUrl = "https://github.com/boulayb/";
		
		version = 1.0.2;
		versionStr = "1.0.2";
		versionAr[] = {1,0,2};
		
		requiredVersion = 1.60;
		requiredAddons[] = {
			"A3_Modules_F",
			"A3_Modules_F_Curator"
			};
		
		weapons[] = {};
		units[] = { "rcdc_Module_SmokeBarrage" };
	};
};

class CfgVehicles
{
	class Logic;
	
	class Module_F : Logic
	{
		class ModuleDescription
		{
			class Anything;
			class EmptyDetector;
		};
	};
	
	class rcdc_Module_SmokeBarrage : Module_F
	{
		scope = 1;
		scopeCurator = 2;
		category = "Supports";
		displayName = "Smoke Barrage";
		icon = "\rcdc_smokeBarrage\data\iconBarrage.paa";
		
		function = "rcdc_fnc_moduleSmokeBarrage";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 0;
		
		side = 7;
		
		class ModuleDescription: ModuleDescription
		{
			description = "Smoke Barrage";
		};
	};
};

class CfgFunctions
{
	class rcdc
	{
		class Supports
		{
			tag = "rcdc";
			file = "\rcdc_SmokeBarrage\functions";
			class moduleSmokeBarrage {};
		};
	};
};