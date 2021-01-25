/*
    KPLIB_fnc_core_canBuildFob

    File: fn_core_canBuildFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Checks if player can build FOB from box.

    Parameter(s):
        _box    - FOB box                       [OBJECT, defaults to objNull]
        _player - Player trying to build FOB    [OBJECT, defaults to objNull]

    Returns:
        True if box is spawned [BOOL]
*/

params [
    ["_box", objNull, [objNull]],
    ["_player", objNull, [objNull]]
];

// Built FOB range should not overlap over sector range
private _minSectorDist = KPLIB_param_fobRange + KPLIB_param_sectorCapRange;

// TODO: TBD: we think we should refactor this to its own function...
// TODO: TBD: perhaps at the same time establish a callbacks include (?) if there is such a thing...
private _onSelectStartbases = {
    params ["_target", "_startbase"];
    (_startbase select 4) <= KPLIB_param_opsRange;
};

(
    alive _box
    && count ([_box, _onSelectStartbases] call KPLIB_fnc_core_findStartbases) == 0
    && ([_minSectorDist, getPos _box, KPLIB_sectors_all + KPLIB_sectors_fobs] call KPLIB_fnc_core_getNearestMarker isEqualTo "")
)

