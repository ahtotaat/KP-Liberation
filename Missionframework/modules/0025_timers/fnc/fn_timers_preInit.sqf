/*
    KPLIB_fnc_timers_preInit

    File: fn_timers_preInit.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-03 15:36:44
    Last Update: 2021-02-03 15:36:47
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:

    Parameter(s):

    Returns:

    Reference:
*/

if (!isServer) exitWith {true};

[format ["[fn_timers_preInit] Initializing..."], "PRE] [TIMERS", true] call KPLIB_fnc_common_log;

// Probably dangerous to wait in such a tight loop
while {serverTime <= 0} do {};

// Negative, or -1, when timer bits are considered inactive or disabled
KPLIB_timers_disabled = -1;

// Specification for the default timers tuple; verbose, yes, and self-documenting
private _default = [] call {
    params [
        ["_duration", KPLIB_timers_disabled, [0]]
        , ["_startTime", [] call KPLIB_fnc_timers_now, [0]]
        , ["_elapsedTime", 0, [0]]
        , ["_timeRemaining", 0, [0]]
    ];
    [_duration, _startTime, _elapsedTime, _timeRemaining];
};

KPLIB_timers_default = _default;

[format ["[fn_timers_preInit] Initialized"], "PRE] [TIMERS", true] call KPLIB_fnc_common_log;

true
