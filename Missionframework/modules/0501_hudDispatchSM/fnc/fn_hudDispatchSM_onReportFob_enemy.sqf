#include "script_component.hpp"

// ...

private _debug = [
    [
        {MPARAM(_onReportFob_debug)}
        , {MPARAM(_onReportFob_enemy_debug)}
    ]
] call MFUNC(_debug);

params [
    [Q(_player), objNull, [objNull]]
    , [Q(_context), locationNull, [locationNull]]
];

[
    _context getVariable [Q(_fobs), []]
    , _context getVariable [Q(_compiledReport), []]
] params [
    Q(_fobs)
    , Q(_compiledReport)
];

if (_debug) then {
    [format ["[fn_hudDispatchSM_onReportFob_enemy] Entering: [count _fobs]: %1"
        , str [count _fobs]], "HUDDISPATCHSM", true] call KPLIB_fnc_common_log;
};

// FOBs being the key ingredient
if (count _fobs > 0) then {

    // TODO: TBD: may want to refactor in terms of uniform preset settings...
    [
        0 max (KPLIB_enemy_awareness min KPLIB_param_enemy_maxAwareness)
        , KPLIB_param_enemy_maxAwareness
        , 0 max (KPLIB_enemy_strength min KPLIB_param_enemy_maxStrength)
        , KPLIB_param_enemy_maxStrength
        , "%"
    ] params [
        Q(_awareness)
        , Q(_maxAwareness)
        , Q(_strength)
        , Q(_maxStrength)
        , Q(_suffix)
    ];

    // TODO: TBD: could these be gradient?
    // TODO: TBD: and preset for that matter
    [
        [0.9, 0, 0, 1]
        , [1, 0.6, 0.2, 1]
        , +KPLIB_core_fobColor
        , [1, 1, 1, 1]
        , (_awareness / _maxAwareness)
        , (_strength / _maxStrength)
    ] params [
        Q(_redColor)
        , Q(_orangeColor)
        , Q(_yellowColor)
        , Q(_whiteColor)
        , Q(_awarenessRatio)
        , Q(_strengthRatio)
    ];

    [
        [_awareness, _maxAwareness, _suffix] call MFUNC(_renderScalar)
        , MVAR(_awarenessRatioPath)
        , [_awarenessRatio, [
            [MPRESET(_enemy_high), _redColor]
            , [MPRESET(_enemy_medium), _orangeColor]
            , [MPRESET(_enemy_low), _yellowColor]], _whiteColor] call MFUNC(_getThresholdColor)
        , [_strength, _maxStrength, _suffix] call MFUNC(_renderScalar)
        , MVAR(_strengthRatioPath)
        , [_strengthRatio, [
            [MPRESET(_enemy_high), _redColor]
            , [MPRESET(_enemy_medium), _orangeColor]
            , [MPRESET(_enemy_low), _yellowColor]], _whiteColor] call MFUNC(_getThresholdColor)
    ] params [
        Q(_renderedAwarenessRatio)
        , Q(_awarenessRatioPath)
        , Q(_awarenessRatioColor)
        , Q(_renderedStrengthRatio)
        , Q(_strengthRatioPath)
        , Q(_strengthRatioColor)
    ];

    _compiledReport append [
        [QMVAR(_fobReport_awareness), _renderedAwarenessRatio]
        , [QMVAR(_fobReport_awarenessPath), _awarenessRatioPath]
        , [QMVAR(_fobReport_awarenessColor), _awarenessRatioColor]
        , [QMVAR(_fobReport_strength), _renderedStrengthRatio]
        , [QMVAR(_fobReport_strengthPath), _strengthRatioPath]
        , [QMVAR(_fobReport_strengthColor), _strengthRatioColor]
    ];
};

_context setVariable [Q(_compiledReport), _compiledReport];

if (_debug) then {
    [format ["[fn_hudDispatchSM_onReportFob_enemy] Fini: [count _compiledReport]: %1"
        , str [count _compiledReport]], "HUDDISPATCHSM", true] call KPLIB_fnc_common_log;
};

true;
