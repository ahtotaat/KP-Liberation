/*
    KPLIB_fnc_logistics_calculateArrivalStatus

    File: fn_logistics_calculateArrivalStatus.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-07 11:51:06
    Last Update: 2021-03-07 13:33:44
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        ...

    Parameters:
        _namespace - a CBA logistics namespace [LOCATION, default: locationNull]

    Returns:
        ...
 */

// TODO: TBD: sprinkle in debugging, entering, fini, reports...
private _debug = [
    [
        {KPLIB_param_logistics_calculateArrivalStatus_debug}
    ]
] call KPLIB_fnc_logistics_debug;

params [
    ["_namespace", locationNull, [locationNull]]
];

([_namespace, [
    ["KPLIB_logistics_status", KPLIB_logistics_status_standby]
]] call KPLIB_fnc_namespace_getVars) params [
    "_status"
];

[
    [_status, KPLIB_logistics_status_aborting] call KPLIB_fnc_logistics_checkStatus
] params [
    "_aborting"
];

_status = if (_aborting) then {
    KPLIB_logistics_status_unloadingAborting;
} else {
    KPLIB_logistics_status_unloading;
};

_status;