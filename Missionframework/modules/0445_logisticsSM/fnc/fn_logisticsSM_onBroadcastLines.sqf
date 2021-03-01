/*
    KPLIB_fnc_logisticsSM_onBroadcastLines

    File: fn_logisticsSM_onBroadcastLines.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-28 16:48:59
    Last Update: 2021-03-01 14:03:13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Publishes the lines to all listening logistics managers.

    Parameters:
        _cids - the client identifiers to address with the lines publication [ARRAY, default: []]

    Returns:
        The callback finished [BOOL]
 */

private _debug = [
    [
        {KPLIB_logisticsSM_onBroadcastLines_debug}
    ]
] call KPLIB_fnc_logisticsSM_debug;

params [
    ["_cids", (KPLIB_logisticsSM_namespace getVariable ["KPLIB_logistics_cids", []]), [[]]]
];

if (_debug) then {
    [format ["[fn_logisticsSM_onBroadcastLines] Entering: [_cids]: %1"
        , str [_cids]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

if (_cids isEqualTo []) exitWith {
    if (_debug) then {
        ["[fn_logisticsSM_onBroadcastLines] No logistics managers", "LOGISTICSSM", true] call KPLIB_fnc_common_log;
    };
    false;
};

private _onPublish = {
    private _cid = _x;
    [_cid] call KPLIB_fnc_logisticsSM_onPublishLines;
    true;
};

private _broadcast = _cids select _onPublish;

private _retval = _broadcast isEqualTo _cids;

if (_debug) then {
    [format ["[fn_logisticsSM_onBroadcastLines] Fini: [_retval]: %1"
        , str [_retval]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

_retval;
