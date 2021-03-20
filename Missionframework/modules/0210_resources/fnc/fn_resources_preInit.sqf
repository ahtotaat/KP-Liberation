/*
    KPLIB_fnc_resources_preInit

    File: fn_resources_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
            Michael W. Powell
    Created: 2018-12-13
    Last Update: 2021-02-17 12:22:17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "PRE] [RESOURCES", true] call KPLIB_fnc_common_log;
};

/*
    ----- Module Globals -----
*/

KPLIB_resources_resourceKind_sup = "Supply";
KPLIB_resources_resourceKind_amm = "Ammo";
KPLIB_resources_resourceKind_fue = "Fuel";

KPLIB_resources_resourceKinds = [
    KPLIB_resources_resourceKind_sup
    , KPLIB_resources_resourceKind_amm
    , KPLIB_resources_resourceKind_fue
];

// Intel currency resource amount
KPLIB_resources_intel = 0;

// TODO: TBD: is a Z offset even necessary? when we have different offsets for different crate class names...
// TODO: TBD: or perhaps would be better to establish a base offset, then the crate offset is an offset from the offset...
KPLIB_resources_storageOffsetZ = 0.6;

// TODO: TBD: there's got to be a better way to align these than a hard-coded table...
// TODO: TBD: i.e. never heard of a matrix for loop?
// Large storage area placement position offsets.

// TODO: TBD: we can probably rinse and repeat this same thing assembling transport vehicle configs as well...
KPLIB_resources_storageOffsetsLarge = [
    [-5.59961, -3.99902, -2.39941, -0.799805, 0.800781, 2.40039, 4.00098, 5.60059]
    , [3.60938, 1.80859, 0.00976563, -1.79102, -3.58984]
] call KPLIB_fnc_resources_registerStoragePositions;

// Small storage area placement position offsets.
KPLIB_resources_storageOffsetsSmall = [
    [-2.34961, -0.75, 0.850586, 2.4502]
    , [1.80078, 0, -1.79883]
] call KPLIB_fnc_resources_registerStoragePositions;

// Configuration settings for crates transported by vehicles ["classname", distance from vehicle center to unload crate, attachTo positions for each box].
// Set and filtered on the server
if (isServer) then {
    KPLIB_resources_transportConfigs = [[
        ["B_Heli_Transport_03_F",                        7.5, [[0.00,  2.20, -1.00], [0.00,  0.50, -1.00], [0.00, -1.20, -1.00]                                            ]],
        ["B_Heli_Transport_03_unarmed_F",                7.5, [[0.00,  2.20, -1.00], [0.00,  0.50, -1.00], [0.00, -1.20, -1.00]                                            ]],
        ["B_T_Truck_01_covered_F",                       6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_T_Truck_01_transport_F",                     6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_T_VTOL_01_infantry_F",                       7.5, [[0.00,  4.70, -4.88], [0.00,  3.00, -4.88], [0.00,  1.30, -4.88], [0.00, -0.40, -4.88], [0.00, -2.10, -4.88]]],
        ["B_T_VTOL_01_vehicle_F",                        7.5, [[0.00,  4.70, -4.88], [0.00,  3.00, -4.88], [0.00,  1.30, -4.88], [0.00, -0.40, -4.88], [0.00, -2.10, -4.88]]],
        ["B_Truck_01_covered_F",                         6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_Truck_01_transport_F",                       6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["CUP_B_Wolfhound_GMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["CUP_B_Wolfhound_HMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["CUP_B_Wolfhound_LMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["C_Offroad_01_F",                               6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["C_Truck_02_covered_F",                         6.5, [[0.00,  0.30,  0.05], [0.00, -1.30,  0.05], [0.00, -2.90,  0.05]                                            ]],
        ["C_Truck_02_transport_F",                       6.5, [[0.00,  0.30,  0.05], [0.00, -1.30,  0.05], [0.00, -2.90,  0.05]                                            ]],
        ["C_Van_01_transport_F",                         6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_C_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_G_Offroad_01_F",                             6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["I_G_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_Heli_Transport_02_F",                        6.5, [[0.00,  4.20, -1.45], [0.00,  2.50, -1.45], [0.00,  0.80, -1.45], [0.00, -0.90, -1.45]                      ]],
        ["LOP_TAK_Civ_Ural",                             6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["LOP_TAK_Civ_Ural_open",                        6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["O_G_Offroad_01_F",                             6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["O_G_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["O_T_Truck_03_covered_ghex_F",                  6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_T_Truck_03_transport_ghex_F",                6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_Truck_03_covered_F",                         6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_Truck_03_transport_F",                       6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["RHS_CH_47F",                                   7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_CH_47F_10",                                7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_CH_47F_light",                             7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_Ural_Civ_03",                              6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_MSV_01",                              6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_Open_Civ_03",                         6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_Open_MSV_01",                         6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_18_DPMT",                 7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_32_MTP",                  7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_CSAR_MTP",                7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy",  5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", 5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",       5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",      5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy",  5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", 5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_d_fmtv_usarmy",               5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_d_open_fmtv_usarmy",          5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_wd_fmtv_usarmy",              5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy",         5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M977A4_BKIT_M2_usarmy_d",               6.5, [[0.00,  0.40,  0.70], [0.00, -1.30,  0.70], [0.00, -3.00,  0.70]                                            ]],
        ["rhsusf_M977A4_BKIT_M2_usarmy_wd",              6.5, [[0.00,  0.40,  0.70], [0.00, -1.30,  0.70], [0.00, -3.00,  0.70]                                            ]],
        ["rhsusf_M977A4_BKIT_usarmy_d",                  6.5, [[0.00,  0.40,  1.40], [0.00, -1.30,  1.40], [0.00, -3.00,  1.40]                                            ]],
        ["rhsusf_M977A4_BKIT_usarmy_wd",                 6.5, [[0.00,  0.40,  1.40], [0.00, -1.30,  1.40], [0.00, -3.00,  1.40]                                            ]],
        ["rhsusf_m998_d_2dr_halftop",                    4.5, [[0.00, -0.90, -0.20]                                                                                        ]],
        ["rhsusf_m998_w_2dr_halftop",                    4.5, [[0.00, -0.90, -0.20]                                                                                        ]]
    ]] call KPLIB_fnc_init_filterMods;

    // Plain transport vehicle classnames array
    KPLIB_resources_transportVehicles = KPLIB_resources_transportConfigs apply {_x select 0};

    // Send filtered lists to clients
    publicVariable "KPLIB_resources_transportConfigs";
    publicVariable "KPLIB_resources_transportVehicles";
};


/*
    ----- Module Initialization -----
*/

// Process CBA Settings
[] call KPLIB_fnc_resources_settings;

// TODO: TBD: may capture in terms of CBA settings...
KPLIB_param_resources_loadRange = 20;

KPLIB_resources_i_sup = 0;
KPLIB_resources_i_amm = 1;
KPLIB_resources_i_fue = 2;

KPLIB_resources_indexes = [
    KPLIB_resources_i_sup
    , KPLIB_resources_i_amm
    , KPLIB_resources_i_fue
];

KPLIB_resources_capDefault = KPLIB_resources_indexes apply {false};
KPLIB_resources_storageValueDefault = KPLIB_resources_indexes apply {0};

/* We will require these when we begin coordinating with proper transactional
    * based accounting. Especially to align indices with their types. */
KPLIB_resources_crateClassesF = [
    KPLIB_preset_crateSupplyF
    , KPLIB_preset_crateAmmoF
    , KPLIB_preset_crateFuelF
];

KPLIB_resources_storageClassesF = [
    KPLIB_preset_storageSmallF
    , KPLIB_preset_storageLargeF
];

// Some globals defined here on the server as the used preset variables aren't present on the clients yet but needed in initial loading
// All valid crate classnames
KPLIB_resources_crateClasses = [
    KPLIB_preset_crateSupplyF
    , KPLIB_preset_crateAmmoF
    , KPLIB_preset_crateFuelF
    , KPLIB_preset_crateSupplyE
    , KPLIB_preset_crateAmmoE
    , KPLIB_preset_crateFuelE
];

// All valid storage classnames
KPLIB_resources_storageClasses = [
    KPLIB_preset_storageSmallE
    , KPLIB_preset_storageSmallF
    , KPLIB_preset_storageLargeE
    , KPLIB_preset_storageLargeF
];

// Storage classnames concerning factory sectors
KPLIB_resources_factoryStorageClasses = [
    KPLIB_preset_storageSmallE
    , KPLIB_preset_storageSmallF
];

if (isServer) then {

    // Arrange some debug flags
    KPLIB_param_resources_pay_debug             = false;
};

// Server section (dedicated and player hosted)
if (isServer) then {

    KPLIB_param_resources_refreshStorageValuePeriodSeconds = 5;

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_resources_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_resources_saveData;}] call CBA_fnc_addEventHandler;

    // Adding actions to spawned crates and storages
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_resources_addActions}] call CBA_fnc_addEventHandler;

    // TOOD: TBD: may not neecd to public anything as long as these are defined for all...
    publicVariable "KPLIB_resources_crateClassesF";
    publicVariable "KPLIB_resources_storageClassesF";

    // Publish variables to clients
    publicVariable "KPLIB_resources_crateClasses";
    publicVariable "KPLIB_resources_storageClasses";

    // Array for all spawned resource crates
    KPLIB_resources_allCrates = [];

    // Array for all storages
    KPLIB_resources_allStorages = [];
};

if (!(hasInterface || isDedicated)) then {
    // HC section
};

KPLIB_resources_imagePaths = [
    "res\ui_supplies.paa"
    , "res\ui_ammo.paa"
    , "res\ui_fuel.paa"
];

if (hasInterface) then {
    // Player section
};

if (isServer) then {
    ["Module initialized", "PRE] [RESOURCES", true] call KPLIB_fnc_common_log;
};

KPLIB_resources_capabilityKeys = [
    "STR_KPLIB_PRODUCTION_CAPABILITY_SUPPLY"
    , "STR_KPLIB_PRODUCTION_CAPABILITY_AMMO"
    , "STR_KPLIB_PRODUCTION_CAPABILITY_FUEL"
];

true;
