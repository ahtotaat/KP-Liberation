/*
    KPLIB_fnc_timers_postInit

    File: fn_timers_postInit.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-03 15:36:37
    Last Update: 2021-02-03 15:36:40
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:

    Parameter(s):

    Returns:
*/

if (!isServer) exitWith {true};

[format ["[fn_timers_postInit] Initializing..."], "POST] [TIMERS", true] call KPLIB_fnc_common_log;

[format ["[fn_timers_postInit] Initialized"], "POST] [TIMERS", true] call KPLIB_fnc_common_log;

true
