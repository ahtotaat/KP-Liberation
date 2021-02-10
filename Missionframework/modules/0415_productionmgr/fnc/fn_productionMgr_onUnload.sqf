#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_productionMgr_onUnload

    File: fn_productionMgr_onUnload.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-02-09 19:10:05
    Last Update: 2021-02-09 19:10:08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Module display onUnload event handler.

    Parameter(s):
        _display - the display [DISPLAY, default: displayNull]
        _exitCode - the exist code when unloading [SCALAR, default: -1]

    Returns:
        Module postInit finished [BOOL]

    References:
        https://community.bistudio.com/wiki/User_Interface_Event_Handlers#onUnload
*/

params [
    ["_display", displayNull, [displayNull]]
    , ["_exitCode", -1, [0]]
];

// Remove the marker when the dialog has completed
deleteMarkerLocal "_productionMgrStorage";
