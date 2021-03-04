/*
    KPLIB_fnc_logisticsSM_onRequestTransportBuild

    File: fn_logisticsSM_onRequestTransportBuild.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-01 12:06:32
    Last Update: 2021-03-01 12:06:36
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Logistics manager requests line transport be built.

    Parameters:
        _targetUuid - the target logistics line UUID for which to build convoy transport [STRING, default: ""]
        _targetFobMarker - the target FOB marker in proximity to the player [STRING, default: ""]
        _cid - the client identifier originating the request [SCALAR, default: -1]

    Returns:
        The event handler finished [BOOL]

    References:
        https://community.bistudio.com/wiki/pushBack
        https://community.bistudio.com/wiki/BIS_fnc_bitflagsCheck
        https://community.bistudio.com/wiki/Category:Function_Group:_Bitwise
 */

private _debug = [
    [
        {KPLIB_logisticsSM_onRequestTransportBuild_debug}
    ]
] call KPLIB_fnc_logisticsSM_debug;

params [
    ["_targetUuid", "", [""]]
    , ["_targetFobMarker", "", [""]]
    , ["_cid", -1, [0]]
];

if (_debug) then {
    [format ["[fn_logisticsSM_onRequestTransportBuild] Entering: [_targetUuid, _targetFobMarker, _cid]: %1"
        , str [_targetUuid, _targetFobMarker, _cid]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

if (_cid < 0) exitWith {
    if (_debug) then {
        [format ["[fn_logisticsSM_onRequestTransportBuild] Invalid client identifier: [_cid]: %1"
        , str [_cid]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
    };
    false;
};

private ["_msg", "_args"];

private _namespace = [_lineUuid] call KPLIB_fnc_logistics_getNamespaceByUuid;
private _status = _namespace getVariable ["KPLIB_logistics_status", KPLIB_logistics_status_standby];

if (!(_status == KPLIB_logistics_status_standby
    || [_status, KPLIB_logistics_status_loadingUnloading] call BIS_fnc_bitflagsCheck)) exitWith {

    private _statusReport = [_status] call KPLIB_fnc_logistics_getStatusReport;

    if (_debug) then {
        [format ["[fn_logisticsSM_onRequestTransportBuild] Status prohibits request: [_targetUuid, _targetFobMarker, '_statusReport', _status, _cid]: %1"
            , str [_targetUuid, _targetFobMarker, ["'", "'"] joinString _statusReport, _status, _cid]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
    };

    _msg = format [localize "STR_KPLIB_LOGISTICS_MSG_CONVOY_TRANSPORT_CANNOT_BUILD", _statusReport];
    [_msg] remoteExec ["KPLIB_fnc_notification_hint", _cid];
    false;
};

private _debit = [] call KPLIB_fnc_logisticsSM_getTransportDebit;

// Assume true at the moment...
private _debited = true;

if (!(_debit isEqualTo KPLIB_resources_storageValueDefault)) then {

    private _debitArgs = +([_targetFobMarker, _debit] call { [(_this#0)] + (_this#1); });
    //                                             location:  ^^^^^^^^^

    _debited = _debitArgs call KPLIB_fnc_resources_pay;
};

if (!_debited) exitWith {
    if (_debug) then {
        [format ["[fn_logisticsSM_onRequestTransportBuild] Insufficient resources: [_targetUuid, _targetFobMarker, _debit, _cid]: %1"
            , str [_targetUuid, _targetFobMarker, _debit, _cid]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
    };
    // TODO: TBD: may further identify the FOB that has the insufficient resources...
    _args = [localize "STR_KPLIB_LOGISTICS_MSG_CONVOY_TRANSPORT_INSUFFICIENT_RESOURCES"] + _debit;
    _msg = format _args;
    [_msg] remoteExec ["KPLIB_fnc_notification_hint", _cid];
    false;
};

private _finalized = [_namespace, _debit, _cid] call {
    params [
        ["_namespace", locationNull, [locationNull]]
        , ["_debit", [], [[]], 3]
        , ["_cid", -1, [0]]
    ];

    private _convoy = _namespace getVariable ["KPLIB_logistics_convoy", []];
    //                                                                  ^^

    // May use the '_transportIndex' for further diagnostics...
    private _transportIndex = _convoy pushBack +KPLIB_resources_storageValueDefault;

    // May not need to set it back again, but do so in the event there was a default get (^)
    _namespace setVariable ["KPLIB_logistics_convoy", _convoy];

    _args = [localize "STR_KPLIB_LOGISTICS_MSG_CONVOY_TRANSPORT_BUILT"] + _debit;
    _msg = format _args;
    [_msg] remoteExec ["KPLIB_fnc_notification_hint", _cid];

    [] call KPLIB_fnc_logisticsSM_onBroadcastLines;

    true;
};

if (_debug) then {
    [format ["[fn_logisticsSM_onRequestTransportBuild] Fini: [_finalized]: %1"
        , str [_finalized]], "LOGISTICSSM", true] call KPLIB_fnc_common_log;
};

_finalized;