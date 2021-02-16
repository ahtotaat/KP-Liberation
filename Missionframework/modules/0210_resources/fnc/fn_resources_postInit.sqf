/*
    KPLIB_fnc_resources_postInit

    File: fn_resources_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "POST] [RESOURCES", true] call KPLIB_fnc_common_log;
};

// Server section (dedicated and player hosted)
if (isServer) then {
    [] call KPLIB_fnc_resources_createRefreshFactoryStorageValues;
    [] call KPLIB_fnc_resources_createRefreshFobStorageValues;
};

if (!(hasInterface || isDedicated)) then {
    // HC section
};

if (hasInterface) then {
    // Player section
};

if (isServer) then {
    ["Module initialized", "POST] [RESOURCES", true] call KPLIB_fnc_common_log;
};

true;
