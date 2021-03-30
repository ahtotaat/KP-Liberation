#include "script_component.hpp"

// ...
// https://community.bistudio.com/wiki/createHashMapFromArray
// https://community.bistudio.com/wiki/deleteAt

private _debug = [
    [
        {MPARAM(_onShow_debug)}
    ]
] call MFUNC(_debug);

params [
    [Q(_player), objNull, [objNull]]
];

[
    toLower KPLIB_hudDispatchSM_dispatchStatus in allVariables _player
    , toLower KPLIB_hudDispatchSM_dispatchReport in allVariables _player
    , _player getVariable [KPLIB_hudDispatchSM_dispatchStatus, MSTATUS(_standby)]
    , _player getVariable [KPLIB_hudDispatchSM_dispatchReport, []]
] params [
    Q(_hasStatus)
    , Q(_hasReport)
    , Q(_dispatchStatus)
    , Q(_dispatchReport)
];

if (_debug) then {
    [format ["[fn_hud_onShow] Entering: [isNull _player, _hasStatus, _hasReport, _dispatchStatus, count _dispatchReport]: %1"
        , str [isNull _player, _hasStatus, _hasReport, _dispatchStatus, count _dispatchReport]], "HUD", true] call KPLIB_fnc_common_log;
};

[_player, _dispatchStatus, +_dispatchReport] call MFUNC(_onReconcileOverlayMap);

[_player] call MFUNC(_onShowSector);

[_player] call MFUNC(_onShowFob);

// TODO: TBD: we wonder whether [player] as an arg array doesn't make a 'copy' of player for OBJECT comparison, variables included
[
    MFUNC(_onShow)
    , [player]
    , MPARAM(_showPeriod)
] call CBA_fnc_waitAndExecute;

if (_debug) then {
    ["[fn_hud_onShow] Fini", "HUD", true] call KPLIB_fnc_common_log;
};

true;
