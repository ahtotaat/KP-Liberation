#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_productionMgr_client_onProductionResponse

    File: fn_productionMgr_client_onProductionResponse.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-10 21:34:00
    Last Update: 2021-02-10 21:34:03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Client module 'onProductionResponse' event handler, responds to the
        'KPLIB_productionMgr_onProductionResponse' CBA owner event.

    Parameter(s):
        _this - an array of production tuples of the controlled factory sectors [ARRAY]

    Returns:
        NONE
*/

private _debug = [] call KPLIB_fnc_productionMgr_debug;

if (_debug) then {
    ["[fn_productionMgr_client_onProductionResponse] Entering...", "PRODUCTIONMGR", true] call KPLIB_fnc_common_log;
};

private _production = _this;

// TODO: TBD: we might verify that production is production...
// TODO: TBD: i.e. (_production select { _x call KPLIB_fnc_production_verifyArray; })

private _display = findDisplay KPLIB_IDD_PRODUCTIONMGR;

if (!(_display isEqualTo displayNull)) then {

    if (_debug) then {
        [format ["[fn_productionMgr_client_onProductionResponse] [count _production]: %1"
            , str [count _production]], "PRODUCTIONMGR", true] call KPLIB_fnc_common_log;
    };

    _display setVariable ["_production", _production];

    [_display displayCtrl KPLIB_IDC_PRODUCTIONMGR_LNBSECTORS] spawn KPLIB_fnc_productionMgr_lnbSectors_onLoad;
};

if (_debug) then {
    ["[fn_productionMgr_client_onProductionResponse] Finished", "PRODUCTIONMGR", true] call KPLIB_fnc_common_log;
};

true;
