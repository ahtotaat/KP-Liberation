/*
    KPLIB_fnc_logisticsMgr_onEndpointsPublished

    File: fn_logisticsMgr_onEndpointsPublished.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-28 17:24:55
    Last Update: 2021-02-28 17:24:58
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Client side 'KPLIB_logisticsMgr_onRefreshLogistics' event handler.

    Parameters:
        _endpoints - an array of the logistics endpoint tuples [ARRAY, default: []]

    Returns:
        The event handler finished [BOOL]
 */

private _debug = [
    [
        {KPLIB_logisticsMgr_onEndpointsPublished_debug}
    ]
] call KPLIB_fnc_logisticsMgr_debug;

params [
    ["_endpoints", [], [[]]]
];

if (_debug) then {
    [format ["[fn_logisticsMgr_onEndpointsPublished] Entering: [count _endpoints, _endpoints]: %1"
        , str [count _endpoints, _endpoints]], "LOGISTICSMGR", true] call KPLIB_fnc_common_log;
};

// (Re-)set the '_lines' in the 'uiNamespace' and (re-)load the LINES LISTNBOX accordingly...
uiNamespace setVariable ["KPLIB_logisticsMgr_endpoints", _endpoints];

// Dissect the views and present them starting with the logistics lines LISTNBOX control
private _onReloadEndpointCombo = {
    private _cboEndpoint = _x;
    [_cboEndpoint] call KPLIB_fnc_logisticsMgr_cboEndpoint_onReload;
};

_onReloadEndpointCombo forEach [
    uiNamespace getVariable ["KPLIB_logisticsMgr_cboAlpha", controlNull]
    , uiNamespace getVariable ["KPLIB_logisticsMgr_cboBravo", controlNull]
];

if (_debug) then {
    ["[fn_logisticsMgr_onEndpointsPublished] Fini", "LOGISTICSMGR", true] call KPLIB_fnc_common_log;
};

true;