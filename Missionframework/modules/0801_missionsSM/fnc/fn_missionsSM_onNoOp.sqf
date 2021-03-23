#include "script_component.hpp"
/*
    KPLIB_fnc_missionsSM_onNoOp

    File: fn_missionsSM_onNoOp.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-20 12:22:56
    Last Update: 2021-03-20 12:22:59
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        ...

    Parameter(s):
        _namespace - a CBA MISSION namespace [LOCATION, default: locationNull]
        _stateOrTransition - the STATE or TRANSITION being proxied [STRING, default: ""]

    Returns:
        The callback has finished [ARRAY]
 */

// TODO: TBD: add logging, etc
private _debug = [
    [
        {MPARAM(_onNoOp_debug)}
    ]
] call MFUNC(_debug);

params [
    [Q(_namespace), locationNull, [locationNull]]
    , [Q(_stateOrTransition), "", [""]]
];

([_namespace, [
    ["KPLIB_mission_uuid", ""]
    , ["KPLIB_mission_templateUuid", ""]
]] call KPLIB_fnc_namespace_getVars) params [
    "_uuid"
    , "_templateUuid"
];

if (_debug) then {
    [format ["[fn_missionsSM_onNoOp] Entering: [_uuid, _templateUuid, _stateOrTransition]: %1"
        , str [_uuid, _templateUuid, _stateOrTransition]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

// TODO: TBD: introduce this in the event that we mess up on some conditions...
// TODO: TBD: so that we have a clue as to "where" we landed in the SM ...

([_namespace, [
    ["KPLIB_mission_status", KPLIB_mission_status_standby]
    , ["KPLIB_mission_timer", +KPLIB_timers_default]
]] call KPLIB_fnc_namespace_getVars) params [
    "_status"
    , "_timer"
];

[
    [_status] call KPLIB_fnc_missions_getStatusReport
] params [
    "_statusReport"
];

if (_debug) then {
    [format ["[fn_missionsSM_onNoOp] Fini: [_status, _statusReport, _timer]: %1"
        , str [_status, _statusReport, _timer]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

true;