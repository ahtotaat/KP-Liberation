/*
    KPLIB_fnc_logistics_onPreInit

    File: fn_logistics_onPreInit.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-25 11:58:41
    Last Update: 2021-02-25 14:47:46
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        ...

    Parameters:
        NONE

    Returns:
        NONE
 */

if (isServer) then {
    ["[fn_logistics_onPreInit] Initializing...", "PRE] [LOGISTICS", true] call KPLIB_fnc_common_log;
};

/*
    ----- Module Globals -----
 */

KPLIB_logistics_status_na                   =  -1;
KPLIB_logistics_status_standby              =   0;
KPLIB_logistics_status_loading              =   1;
KPLIB_logistics_status_enRoute              =   2;
KPLIB_logistics_status_aborting             =   4;
KPLIB_logistics_status_unloading            =   8;
KPLIB_logistics_status_noResources          =  16;
KPLIB_logistics_status_routeBlocked         =  32;
KPLIB_logistics_status_noSpace              =  64;
KPLIB_logistics_status_ambushed             = 128;
KPLIB_logistics_status_abandoned            = 256;

KPLIB_logistics_status_loadingNoResoures    = KPLIB_logistics_status_loading    + KPLIB_logistics_status_noResources;
KPLIB_logistics_status_unloadingNoSpace     = KPLIB_logistics_status_unloading  + KPLIB_logistics_status_noSpace;
KPLIB_logistics_status_enRouteAmbushed      = KPLIB_logistics_status_enRoute    + KPLIB_logistics_status_ambushed;
KPLIB_logistics_status_enRouteBlocked       = KPLIB_logistics_status_enRoute    + KPLIB_logistics_status_routeBlocked;
KPLIB_logistics_status_enRouteAbandoned     = KPLIB_logistics_status_enRoute    + KPLIB_logistics_status_abandoned;
KPLIB_logistics_status_abortingAmbushed     = KPLIB_logistics_status_aborting   + KPLIB_logistics_status_ambushed;
KPLIB_logistics_status_abortingBlocked      = KPLIB_logistics_status_aborting   + KPLIB_logistics_status_routeBlocked;
KPLIB_logistics_status_abortingAbandoned    = KPLIB_logistics_status_aborting   + KPLIB_logistics_status_abandoned;

KPLIB_logistics_status_enRouteAbortingAbandoned = KPLIB_logistics_status_enRoute + KPLIB_logistics_status_aborting + KPLIB_logistics_status_abandoned;

// TODO: TBD: this one is probably "either" server or client side, but more than likely we eventually favor client side only for UI purposes...
// The first one is a special case, but every other one should be compiled in the report in that order
KPLIB_logistics_status_reports = [
    [KPLIB_logistics_status_standby, localize "STR_KPLIB_LOGISTICS_STATUS_STANDBY"]
    , [KPLIB_logistics_status_loading, localize "STR_KPLIB_LOGISTICS_STATUS_LOADING"]
    , [KPLIB_logistics_status_enRoute, localize "STR_KPLIB_LOGISTICS_STATUS_EN_ROUTE"]
    , [KPLIB_logistics_status_aborting, localize "STR_KPLIB_LOGISTICS_STATUS_ABORTING"]
    , [KPLIB_logistics_status_unloading, localize "STR_KPLIB_LOGISTICS_STATUS_UNLOADING"]
    , [KPLIB_logistics_status_noResources, localize "STR_KPLIB_LOGISTICS_STATUS_NO_RESOURCES"]
    , [KPLIB_logistics_status_routeBlocked, localize "STR_KPLIB_LOGISTICS_STATUS_ROUTE_BLOCKED"]
    , [KPLIB_logistics_status_noSpace, localize "STR_KPLIB_LOGISTICS_STATUS_NO_SPACE"]
    , [KPLIB_logistics_status_ambushed, localize "STR_KPLIB_LOGISTICS_STATUS_AMBUSHED"]
    , [KPLIB_logistics_status_abandoned, localize "STR_KPLIB_LOGISTICS_STATUS_ABANDONED"]
];


/*
    ----- Module Initialization -----
 */

// Process CBA Settings
[] call KPLIB_fnc_logistics_settings;

/* Should be "simple" primitive data, no HASHMAP or other objects... It might be useful here
 * for "all" both server and clients, for UI and for server side serialization purposes. */
KPLIB_logistics_tupleTemplate = +[
    [] call KPLIB_fnc_uuid_create_string
    , KPLIB_logistics_status_na
    , KPLIB_timers_default
    , []            // ALPHA and BRAVO endpoints, empty for STANDBY
    , []            // CONVOY, array of 'KPLIB_resources_storageValue' shaped elements
    , [
        ["_status", KPLIB_logistics_status_na]
        , ["_duration", KPLIB_timers_disabled]
        , ["_timeRemaining", 0]
        , ["_transportSpeed", 0]
        , ["_totalDistance", 0]
        , ["_transitDistance", 0]
        , ["_transitPos", [0, 0, 0]]
        , ["_transitDir", 0]
        , ["_transitGridref", ""]
        , ["_actualPos", [0, 0, 0]]
        , ["_actualDir", 0]
        , ["_actualGridref", ""]
    ]
    // TODO: TBD: may append other bits, like transport economics, cost and recycle specs, etc, etc...
];

if (isServer) then {

    KPLIB_param_logistics_verificationDebug                 = false;
    KPLIB_param_logistics_endpointVerificationDebug         = true;
    KPLIB_param_logistics_arrayVerificationDebug            = true;
    KPLIB_param_logistics_namespaceVerificationDebug        = true;

    KPLIB_logisticsServer_telemetryDefault = [] call {
        private _zeroPos = +KPLIB_zeroPos;

        params [
            ["_totalDistance", 0, [0]]
            , ["_transitDistance", 0, [0]]
            , ["_transportSpeedMps", 0, [0]]
            , ["_transitPos", _zeroPos, [[]]]
            , ["_transitDir", 0, [0]]
            , ["_actualPos", _zeroPos, [[]]]
            , ["_actualDir", 0, [0]]
        ];

        [
            _totalDistance
            , _transitDistance
            , _transportSpeedMps
            , _transitPos
            , _transitDir
            , _actualPos
            , _actualDir
        ];
    };

    // Server section (dedicated and player hosted)
    KPLIB_logistics_namespaces = [];

    ["KPLIB_doLoad", {[] call KPLIB_fnc_logistics_onLoadData;}] call CBA_fnc_addEventHandler;
    ["KPLIB_doSave", {[] call KPLIB_fnc_logistics_onSaveData;}] call CBA_fnc_addEventHandler;
};

if (!(hasInterface || isDedicated)) then {
    // HC section
};

if (hasInterface) then {
    // Player section
};

if (isServer) then {
    ["[fn_logistics_onPreInit] Initialized", "PRE] [LOGISTICS", true] call KPLIB_fnc_common_log;
};

true;
