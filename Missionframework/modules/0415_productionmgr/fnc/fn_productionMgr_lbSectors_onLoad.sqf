#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_productionMgr_lbSectors_onLoad

    File: fn_productionMgr_lbSectors_onLoad.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-06 12:56:43
    Last Update: 2021-02-06 12:56:45
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Module lbSectors onLoad event handler.

    Parameter(s):
        _lbSectors - the list box control [CONTROL]

    Returns:
        Module postInit finished [BOOL]

    References:
        https://community.bistudio.com/wiki/User_Interface_Event_Handlers#onLoad
*/

params [
    ["_lbSectors", controlNull, [controlNull]]
];

private _display = findDisplay KPLIB_IDD_PRODUCTIONMGR;

// TODO: TBD: perchance to notification_system ...
systemChat "fn_productionMgr_lbSectors_onLoad";

private _someData = ["123456", "Sector Name"];
private _count = 100;
while {(lbSize _lbSectors) < 100} do {
    _lbSectors lnbAddRow _someData;
};

// TODO: TBD: ...