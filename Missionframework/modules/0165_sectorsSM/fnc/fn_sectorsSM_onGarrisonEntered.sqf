#include "script_component.hpp"
/*
    KPLIB_fnc_sectorsSM_onGarrisonEntered

    File: fn_sectorsSM_onGarrisonEntered.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-04-13 20:16:27
    Last Update: 2021-04-13 20:16:30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        GARRISON 'onStateEntered' event handler.

    Parameter(s):
        _namespace - a CBA SECTOR namespace [LOCATION, default: locationNull

    Returns:
        The event handler has finished [BOOL]
 */

private _debug = MPARAMSM(_onGarrisonEntered_debug);

params [
    [Q(_namespace), locationNull, [locationNull]]
];

private _markerName = _namespace getVariable [QMVAR(_markerName), ""];

if (_debug) then {
    [format ["[fn_sectorsSM_onGarrisonEntered] Entering: [_markerName]: %1"
        , str [_markerName]], "SECTORSSM", true] call KPLIB_fnc_common_log;
};

// We are 'here' because SECTOR has not yet been GARRISONED...
[_namespace, MSTATUS(_garrison), { true; }, QMVAR(_status)] call KPLIB_fnc_namespace_setStatus;

// TODO: TBD: spec out what the garrison should look like
// TODO: TBD: given awareness, strength
// TODO: TBD: also civrep
// TODO: TBD: any other conditions?

if (_debug) then {
    [format ["[fn_sectorsSM_onGarrisonEntered] Fini: [_markerName]: %1"
        , str [_markerName]], "SECTORSSM", true] call KPLIB_fnc_common_log;
};

true;