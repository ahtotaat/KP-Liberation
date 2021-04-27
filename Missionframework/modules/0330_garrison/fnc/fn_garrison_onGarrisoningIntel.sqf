#include "script_component.hpp"
/*
    KPLIB_fnc_garrison_onGarrisoningIntel

    File: fn_garrison_onGarrisoningIntel.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-04-27 11:31:44
    Last Update: 2021-04-27 11:31:46
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Garrisons the INTEL bits at a specified location. We support creating up to the
        requested count or the number of buildings locations, which ever comes first. Only
        supports doing so at the MILITARY BASE sectors. We do some bookkeeping preparation
        for use later on during events such as SECTOR DEACTIVATED, GATHER INTEL, etc.

        We collect the INTEL bits into an ARRAY that we set as a variable on the namespace,
        'KPLIB_garrison_intelObjs'. Additionally, we also set the TARGET NAMESPACE on each
        of the INTEL bits for use later on, 'KPLIB_garrison_targetNamespace'. We also set
        a UUID on each of the INTEL bits for easier identification, 'KPLIB_garrison_uuid'.

    Parameter(s):
        _namespace - a CBA SECTOR namespace being garrisoned for INTEL bits
            [LOCATION, default: locationNull]

    Returns:
        The number of INTEL bits actually created [SCALAR]

    References:
        https://community.bistudio.com/wiki/buildingPos
        https://community.bistudio.com/wiki/createVehicle
        https://community.bistudio.com/wiki/nearestObjects
        https://community.bistudio.com/wiki/BIS_fnc_arrayShuffle
        https://dictionary.com/browse/stochastic
        https://sciencedirect.com/topics/earth-and-planetary-sciences/stochasticity
        https://en.wikipedia.org/wiki/Stochastic
 */

params [
    [Q(_namespace), locationNull, [locationNull]]
];

[
    _namespace getVariable [Q(KPLIB_sectors_markerName), ""]
    , _namespace getVariable [Q(KPLIB_sectors_markerName), ""]
    , _namespace getVariable [QMVAR(_intelClassNames), []]
    , []
] params [
    Q(_markerName)
    , Q(_markerPos)
    , Q(_intelClassNames)
    , Q(_intelObjs)
];

if ((_intelClassNames isEqualTo []) || !(_markerName in KPLIB_sectors_military)) exitWith {
    count _intelObjs;
};

[
    nearestObjects [_markerPos, [Q(Building)], KPLIB_param_sectors_capRange, true]
] params [
    Q(_buildings)
];

// Shuffle some arrays for maximum stochastic effect
_intelClassNames = _intelClassNames call BIS_fnc_arrayShuffle;

// We only spawn INTEL in RELATIVELY UNDAMAGED BUILDINGS given THRESHOLD
_buildings = _buildings select { damage _x <= MPARAM(_baseIntelBuildingDamageThreshold); };
// We do not care about the BUILDING per se but rather the available POSITIONS
private _positions = [[], _buildings apply { _x buildingPos -1; }] call KPLIB_fnc_linq_aggregate;
_positions = _positions call BIS_fnc_arrayShuffle;

private _whereIntelCreated = {
    private _targetClassName = _x;
    private _positionCount = count _positions;

    // The rest is handled loosely coupled and transparent to the actual GARRISON effort
    if (_positionCount > 0) then {

        private _pos = _positions deleteAt 0;
        // TODO: TBD: we do not need to run through the KPLIB API vehicle creation bits...

        // Position is ATL so that works out perfectly
        private _obj = createVehicle [_targetClassName, [(_pos#0), (_pos#1), (_pos#2) + 0.75], [], 0.25, Q(can_collide)];
        //                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        // Prepares the INTEL bit for easier identification and bookkeeping later on
        { _obj setVariable _x; } forEach [
            [QMVAR(_targetNamespace), _namespace]
            , [QMVAR(_uuid), [] call KPLIB_fnc_uuid_create_string]
        ];

        // This array is critical we will set this on the CBA SECTOR namespace
        _intelObjs pushBack _obj;
    };

    _positionCount > 0;
};

// May like to log this in debugging but for now we simply capture the response
private _createdClassNames = _intelClassNames select _whereIntelCreated;
// May also log left over '_positions', (_intelClassNames - _createdClassNames), etc

// For use later on during GATHER INTEL and SECTOR DEACTIVATED events
_namespace setVariable [QMVAR(_intelObjs), _intelObjs];

count _intelObjs;
