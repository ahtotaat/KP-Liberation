#include "script_component.hpp"
/*
    KPLIB_fnc_sectorsSM_timerHasElapsed

    File: fn_sectorsSM_timerHasElapsed.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-04-13 22:05:34
    Last Update: 2021-04-13 22:05:37
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Returns whether the CBA SECTOR namespace TIMER has elapsed.

    Parameter(s):
        _namespace - a CBA SECTOR namespace [LOCATION, default: locationNull]

    Returns:
        Whether the associated timer has elapsed [BOOL]
 */

private _debug = MPARAMSM(_timerHasElapsed_debug);

params [
    [Q(_namespace), locationNull, [locationNull]]
];

[
    _namespace getVariable [QMVAR(_markerName), ""]
    , _namespace getVariable [QMVAR(_timer), ""]
] params [
    Q(_markerName)
    , Q(_timer)
];

if (_debug) then {
    [format ["[fn_sectorsSM_timerHasElapsed] Entering: [_markerName, _timer]: %1"
        , str [_markerName, _timer]], "SECTORSSM", true] call KPLIB_fnc_common_log;
};

private _elapsed = false;

if (_timer call KPLIB_fnc_timers_isRunning) then {
    private _timer = _timer call KPLIB_fnc_timers_refresh;
    _elapsed = _timer call KPLIB_fnc_timers_hasElapsed;
    _namespace setVariable [QMVAR(_timer), _timer];
};

if (_debug) then {
    [format ["[fn_sectorsSM_timerHasElapsed] Fini: [_markerName, _elapsed]: %1"
        , str [_markerName, _elapsed]], "SECTORSSM", true] call KPLIB_fnc_common_log;
};

_elapsed;