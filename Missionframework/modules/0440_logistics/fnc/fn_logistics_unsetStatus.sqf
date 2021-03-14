/*
    KPLIB_fnc_logistics_unsetStatus

    File: fn_logistics_unsetStatus.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-07 12:03:32
    Last Update: 2021-03-14 11:19:30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Unsets the STATUS on either a TARGET STATUS itself, or via its hosting CBA logistics namespace.

    Parameter(s):
        _target - a status flags [SCALAR, default: KPLIB_logistics_status_standby], or:
            a CBA logistics namespace [LOCATION]
        _mask - the bit flags mask to unset [SCALAR, default: KPLIB_logistics_status_standby]
        _predicate - predicate callback used to indicate whether to unset [CODE, default: _always]

    Returns:
        The TARGET argument [SCALAR, or LOCATION]

    References:
        https://community.bistudio.com/wiki/BIS_fnc_bitflagsCheck
 */

private _always = { true; };

params [
    ["_target", KPLIB_logistics_status_standby, [0, locationNull]]
    , ["_mask", KPLIB_logistics_status_standby, [0]]
    , ["_predicate", _always, [{}]]
];

private _onUnsetStatusRaw = {
    params [
        ["_status", KPLIB_logistics_status_standby, [0]]
        , ["_mask", KPLIB_logistics_status_standby, [0]]
    ];
    [_status, _mask] call BIS_fnc_bitflagsUnset;
};

private _onUnsetStatusNamespace = {
    params [
        ["_namespace", locationNull, [locationNull]]
        , ["_mask", KPLIB_logistics_status_standby, [0]]
    ];

    ([_namespace, [
        ["KPLIB_logistics_status", KPLIB_logistics_status_standby]
    ]] call KPLIB_fnc_namespace_getVars) params [
        "_status"
    ];

    private _newStatus = [_status, _mask] call _onUnsetStatusRaw;

    [_namespace, [
        ["KPLIB_logistics_status", _newStatus]
    ]] call KPLIB_fnc_namespace_setVars;

    _namespace;
};

if ([_target, _mask] call _predicate) then {

    _target = switch (true) do {

        case (_target isEqualType KPLIB_logistics_status_standby): {
            [_target, _mask] call _onUnsetStatusRaw;
        };

        case (_target isEqualType locationNull): {
            [_target, _mask] call _onUnsetStatusNamespace;
        };

        default { _target; };
    };
};

_target;
