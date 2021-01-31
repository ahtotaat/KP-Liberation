/*
    KPLIB_fnc_core_selectFobs

    File: fn_core_selectFobs.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-01-31 13:10:55
    Last Update: 2021-01-31 13:10:58
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Responds with an array of the Forward Operating Base (FOB) tuples meeting the predicated conditions.

    Parameters:
        _target - a target object given to compare against the Eden bits [OBJECT, default: objNull]
        _predicate - a callback used to evaluate _target distance from each FOB tuple [CODE, default: {false}]
            - Given arguments: [
                ["_target", objNull, [objNull]]
                , ["_dist2d", 0, [0]]
                , ["_x", [], [[]]]
            ]

    Returns:
        The Eden plus distance tuples matching the predicate [ARRAY]
*/

// TODO: TBD: could go either way, this is core? could be "common" as well...
// TODO: TBD: we'll start here for the time being...

params [
    ["_target", objNull, [objNull]]
    , ["_predicate", {false}, [{}]]
];

private _applied = KPLIB_sectors_fobs apply {
    private _dist2d = if (isNull _target) then {-1} else {
        _target distance2D (_x select 2 select 1);
    };
    [_target, _dist2d, _x]
};

_applied select {_x call _predicate};
