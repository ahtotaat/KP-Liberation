/*
    KPLIB_fnc_logisticsSM_onPostInit

    File: fn_logisticsSM_onPostInit.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-25 11:58:41
    Last Update: 2021-02-25 11:58:44
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        ...

    Parameters:
        NONE

    Returns:
        NONE
 */

if (isServer) then {
    ["[fn_logisticsSM_onPostInit] Initializing...", "PRE] [LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

/*
    ----- Module Globals -----
 */


/*
    ----- Module Initialization -----
 */

[] call KPLIB_fnc_logisticsSM_settings;

if (isServer) then {
    // Server section (dedicated and player hosted)

    KPLIB_logisticsSM_onPublishLines_debug          = true;
    KPLIB_logisticsSM_onLogisticsMgrOpened_debug    = true;
    KPLIB_logisticsSM_onLogisticsMgrClosed_debug    = true;
    KPLIB_logisticsSM_onRequestLineChange_debug     = true;
};

if (!(hasInterface || isDedicated)) then {
    // HC section
};

if (hasInterface) then {
    // Player section
};

if (isServer) then {
    ["[fn_logisticsSM_onPostInit] Initialized", "PRE] [LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

true;
