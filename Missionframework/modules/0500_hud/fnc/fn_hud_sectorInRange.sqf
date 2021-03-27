#include "script_component.hpp"

// ...

// As a function of cap range times coefficient
private _defaultRange = MPARAM(_sectorReportRangeCoefficient) * KPLIB_param_sectorCapRange;

// TODO: TBD: factoring on this one could possibly be better, seems more generic than just HUD
params [
    [Q(_player), objNull, [objNull]]
    , [Q(_bravoMarker), "", [""]]
    , [Q(_range), _defaultRange, [0]]
];

if (_bravoMarker isEqualTo "") exitWith {
    false;
};

// Defer to the core calculation
[_player, markerPos _bravoMarker, _range] call MFUNC(_inRange);
