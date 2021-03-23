#include "script_component.hpp"
/*
    KPLIB_fnc_mission_getArrayTelemetry

    File: fn_mission_getArrayTelemetry.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-20 00:58:26
    Last Update: 2021-03-20 00:58:28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Decodes the mission '_status' in terms of its bitwise flags as a human readable report.

    Parameters:
        _status - a bitwise encoded logistics status [SCALAR, default: 0]

    Returns:
        The namespace matching the '_targetUuid' or 'locationNull' if a match could not be found [LOCATION]

    References:
        https://community.bistudio.com/wiki/BIS_fnc_bitflagsCheck
 */

// TODO: TBD: need to arrange telem callbacks a bit better, it is too confusing...
// TODO: TBD: be not afraid to intro a started versus running versus template individual functions...
// TODO: TBD: plus whatever specific mission callbacks might exist...
params [
    [Q(_mission), locationNull, [locationNull]]    
];

private _retval = [];

if (isNull _mission) exitWith {
    _retval;
};

([_mission, [
    [QMVAR1(_uuid), ""]
    , [QMVAR1(_onGetTelemetry), MFUNC1(_onNoOpTelemetry)]
]] call KPLIB_fnc_namespace_getVars) params [
    Q(_uuid)
    , Q(_onGetTelemetry)
];

[
    _uuid isEqualTo ""
    , [_mission, MSTATUS1(_standby)] call MFUNC1(_checkStatus)
] params [
    Q(_running)
    , Q(_standby)
];

/* Presents a different set of TELEMETRY depending on the circumstances:
 *      - (_running && _standby)
 *      - (_running && !_standby)
 *      - (!_running) - or template, the default case
 * We could probably structure this as a simple "running/not-running" if statement,
 * but we also want to allow for esoteric corner cases as needs arise.
 */
_retval = switch (true) do {
    case (_running): {

        ([_mission, +[
            [QMVAR1(_status), MSTATUS1(_standby)]
            , [QMVAR1(_timer), KPLIB_timers_default]
            , [QMVAR1(_pos), KPLIB_zeroPos]
        ]] call KPLIB_fnc_namespace_getVars) params [
            Q(_status)
            , Q(_timer)
            , Q(_pos)
        ];

        [
            [_status] call MFUNC(_getStatusReport)
            , mapGridPosition _pos
        ] params [
            Q(_statusReport)
            , Q(_gridref)
        ];

        [
            [QMVAR1(_statusReport), _statusReport]
            , [QMVAR1(_timer), _timer]
            , [QMVAR1(_gridref), _gridref]
        ];
    };
    default {

        ([_mission, +[
            [QMVAR1(_cost), MVAR1(_zeroDebit)]
        ]] call KPLIB_fnc_namespace_getVars) params [
            Q(_cost)
        ];

        _cost params [
            [Q(_supplyCost), 0, [0]]
            , [Q(_ammoCost), 0, [0]]
            , [Q(_fuelCost), 0, [0]]
            , [Q(_intelCost), 0, [0]]
        ];

        // De-con the paths
        (KPLIB_resources_imagePaths + [KPLIB_common_intelPath, KPLIB_common_intelColor]) params [
            Q(_supplyPath)
            , Q(_ammoPath)
            , Q(_fuelPath)
            , Q(_intelPath)
            , Q(_intelColor)
        ];

        [
            [QMVAR1(_supplyCost), toUpper localize "STR_KPLIB_PRODUCTION_CAPABILITY_SUPPLY", str _supplyCost, _supplyPath]
            , [QMVAR1(_ammoCost), toUpper localize "STR_KPLIB_PRODUCTION_CAPABILITY_AMMO", str _ammoCost, _ammoPath]
            , [QMVAR1(_fuelCost), toUpper localize "STR_KPLIB_PRODUCTION_CAPABILITY_FUEL", str _fuelCost, _fuelPath]
            , [QMVAR1(_intelCost), toUpper localize "STR_KPLIB_MISSIONSMGR_TELEMETRY_INTEL", str _intelCost, _intelPath, _intelColor]
        ];
    };
};

// Then append MISSION specific TELEMETRY
_retval append ([_mission] call _onGetTelemetry);

_retval;