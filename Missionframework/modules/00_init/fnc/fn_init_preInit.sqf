/*
    KPLIB_fnc_init_preInit

    File: fn_init_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [INIT", true] call KPLIB_fnc_common_log;};

/*
    ----- Module Globals -----
*/

// Name of the save key inside of the [ServerProfileName].vars.Arma3Profile file.
KPLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME_REWRITE";
// Variable for ending the campaign
KPLIB_campaignRunning = true;
// Respawn position shortcut
KPLIB_eden_respawnPos = getMarkerPos "respawn";
// All preset variable names as collection for processing
KPLIB_preset_allVariables = [];
// Civilian side color
KPLIB_preset_colorC = "ColorCIV";
// Civilian side color (active)
KPLIB_preset_colorActC = "ColorPink";
// Enemy side color
KPLIB_preset_colorE = "ColorEAST";
// Enemy side color (active)
KPLIB_preset_colorActE = "ColorRed";
// Friendly side color
KPLIB_preset_colorF = "ColorWEST";
// Friendly side color (active)
KPLIB_preset_colorActF = "ColorBlue";
// Resistance side color
KPLIB_preset_colorR = "ColorGUER";
// Resistance side color (active)
KPLIB_preset_colorActR = "ColorGreen";
// Civilian side
KPLIB_preset_sideC = civilian;
// Enemy side
KPLIB_preset_sideE = east;
// Player side
KPLIB_preset_sideF = west;
// Resistance side
KPLIB_preset_sideR = resistance;
// Reset position shortcut
KPLIB_resetPos = [99999,99999,0];
// Indicator if the saved data is fully loaded
KPLIB_save_loaded = false;
// Spawnpoints for air vehicles
KPLIB_sectors_airspawn = [];
// All capturable sectors
KPLIB_sectors_all = [];
// All active sectors
KPLIB_sectors_active = [];
// Sectors which are captured by blufor
KPLIB_sectors_blufor = [];
// All city sectors
KPLIB_sectors_city = [];
// All factory sectors
KPLIB_sectors_factory = [];
// Positions of all FOBs
KPLIB_sectors_fobs = [];
// Locked vehicles <-> military bases connection array
KPLIB_sectors_lockedVeh = [];
// Markers for the locked vehicles
KPLIB_sectors_lockedVehMarkers = [];
// All metropolis (capital) sectors
KPLIB_sectors_metropolis = [];
// All military sectors
KPLIB_sectors_military = [];
// Spawnpoints for secondary missions and enemy forces
KPLIB_sectors_spawn = [];
// All radiotowers
KPLIB_sectors_tower = [];
// Zero position shortcut
KPLIB_zeroPos = [0,0,0];
/*
 The startbase markerType is the mil_start icon.
 23. Start / "mil_start"
 https://community.bistudio.com/wiki/CfgMarkers#Arma_3
*/
KPLIB_startbase_markerType = "mil_start";

/* DeployType enumerated:
 * -1: Deploy type unknown, 'nil'
 * 0: Operations start base
 * 1: FOB
 * 2: Mobile
 */
KPLIB_deployType_nil = -1;
KPLIB_deployType_ops = 0;
KPLIB_deployType_fob = 1;
KPLIB_deployType_mob = 2;


/*
    ----- Module Initialization -----
*/

// Execute config guard function
[] call KPLIB_fnc_init_configGuard;

// Check for ACE
KPLIB_ace_enabled = isClass (configFile >> "CfgPatches" >> "ace_main");
KPLIB_ace_medical = isClass (configfile >> "CfgPatches" >> "ace_medical");

// Check for KP Ranks
KPLIB_kpr_enabled = isClass (configFile >> "CfgPatches" >> "KP_Ranks");

// Process CBA Settings
[] call KPLIB_fnc_init_settings;

// Read the KPLIB_config.sqf file
[] call compile preprocessFileLineNumbers "KPLIB_config.sqf";

// Parameter processing and vanilla save deactivation on the server only
if (isServer) then {
    enableSaving [false, false];

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_init_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_init_saveData;}] call CBA_fnc_addEventHandler;

    // Load preset files
    [] call KPLIB_fnc_init_loadPresets;
};

if (isServer) then {["Module initialized", "PRE] [INIT", true] call KPLIB_fnc_common_log;};

true
