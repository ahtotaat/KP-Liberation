#include "script_component.hpp"
/*
    KPLIB_fnc_sectors_getSectorIcon

    File: fn_sectors_getSectorIcon.sqf
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-04-14 16:21:05
    Last Update: 2021-04-21 21:51:37
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Returns the SECTOR ICON path corresponding to the MARKER NAME according to its form,
        fit, or function. These include: TOWER, FACTORY, MILITARY, CITY, METROPOLIS.

    Parameter(s):
        _markerName - the marker name [STRING, default: ""]

    Returns:
        A SECTOR ICON path corresponding to the MARKER NAME [STRING]
 */

private _debug = MPARAM(_getSectorIcon_debug);

params [
    [Q(_markerName), "", [""]]
    , [Q(_sectorIconPathDefault), "", [""]]
];

// Extract the prefix of either the expected width or that of the given marker whichever is shorter
private _markerPrefix = _markerName select [
    0
    , (count _markerName) min (count MPRESET(_metropolisPrefix))
];

private _sectorIcon = switch (_markerPrefix) do {
    case MPRESET(_towerPrefix)      :   { MPRESET(_towerIcon);      };
    case MPRESET(_factoryPrefix)    :   { MPRESET(_factoryIcon);    };
    case MPRESET(_basePrefix)       :   { MPRESET(_baseIcon);       };
    case MPRESET(_cityPrefix)       :   { MPRESET(_cityIcon);       };
    case MPRESET(_metropolisPrefix) :   { MPRESET(_metropolisIcon); };
    default                             { _sectorIconPathDefault;   };
};

_sectorIcon;