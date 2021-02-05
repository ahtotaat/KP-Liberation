/*
    KPLIB_fnc_resources_pay

    File: fn_resources_pay.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
            Michael W. Powell [22nd MEU SOC]
    Created: 2018-12-16
    Last Update: 2021-02-05 12:43:41
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Removes given amount of resources from the provided location.

    Parameter(s):
        _location   - Sector or FOB marker from where to pay the resources from [STRING, default: ""]
        _supplies   - Amount of supplies to pay                                 [NUMBER, default: 0]
        _ammo       - Amount of ammo to pay                                     [NUMBER, default: 0]
        _fuel       - Amount of fuel to pay                                     [NUMBER, default: 0]
        _range      - Range about which to consider storage containers          [NUMBER, default: KPLIB_param_fobRange]

    Returns:
        Payment successful  [BOOL]
*/

// TODO: TBD: this is a lot of code, switches, and so forth...
// TODO: TBD: we think we can do better if we assume a couple of things about a transaction, shape of:
// TODO: TBD: [_resourceIndex, _amount], where (_resourceIndex in [0, 1, 2]) ...
// TODO: TBD: ... and _amount is the _amount, or amount of change, whether debit or credit
// TODO: TBD: HOWEVER... not, not, NOT this sprint... maybe a future sprint do we look to simplify that whole thing...
params [
    ["_location", "", [""]]
    , ["_supplies", 0, [0]]
    , ["_ammo", 0, [0]]
    , ["_fuel", 0, [0]]
    , ["_range", KPLIB_param_fobRange, [0]]
];

// Can always pay if there is no price
if ([_supplies, _ammo, _fuel] isEqualTo [0,0,0]) exitWith {true};

// Exit if no location is given
if (_location isEqualTo "") exitWith {false};

// Check if the location even has the needed amount of resources
private _resTotal = [_location] call KPLIB_fnc_resources_getResTotal;
if (
    ((_resTotal select 0) < _supplies) ||
    ((_resTotal select 1) < _ammo) ||
    ((_resTotal select 2) < _fuel)
) exitWith {false};

// Get all storage areas in the vicinity of the marker
private _storages = nearestObjects [markerPos _location, KPLIB_resources_storageClasses, KPLIB_param_fobRange];

// Get the stored resource crates by type
private _sCrates = [];
private _aCrates = [];
private _fCrates = [];
{
    {
        switch (typeOf _x) do {
            case KPLIB_preset_crateSupplyE;
            case KPLIB_preset_crateSupplyF: {_sCrates pushBack _x};
            case KPLIB_preset_crateAmmoE;
            case KPLIB_preset_crateAmmoF: {_aCrates pushBack _x};
            case KPLIB_preset_crateFuelE;
            case KPLIB_preset_crateFuelF: {_fCrates pushBack _x};
        };
    } forEach (attachedObjects _x);
} forEach _storages;

// Remove crates according to needed resources
private ["_resource", "_crate", "_value"];
{
    _resource = _x select 0;
    while {_resource > 0} do {
        _crate = (_x select 1) deleteAt 0;
        _value = _crate getVariable ["KPLIB_resources_crateValue", 0];

        // Check if crate holds enough resources already
        if (_resource >= _value) then {
            _resource = _resource - _value;
            _value = 0;
        } else {
            _value = _value - _resource;
            _resource = 0;
        };

        // Remove crate, if needed. Or adjust value
        if (_value isEqualTo 0) then {
            detach _crate;
            deleteVehicle _crate;
        } else {
            _crate setVariable ["KPLIB_resources_crateValue", _value, true];
        }
    };
} forEach [[_supplies, _sCrates], [_ammo, _aCrates], [_fuel, _fCrates]];

// Reorder the crates on all storages to close the possible gaps
{
    [_x] call KPLIB_fnc_resources_orderStorage;
} forEach _storages;

true
