/*

    File: script_component.hpp
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-19 17:42:23
    Last Update: 2021-03-19 17:42:26
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for mission module scripts
 */

// TODO: TBD: could potentially hike this up the include chain...
#define LIB KPLIB
#define MODULE mission
#define MODULES MODULE##s

//// Mission get var
//#define MGVAR(var, defVal)      (KPLIB_mission_data getVariable [var, defVal])
//// Mission set var
//#define MSVAR(var, val)         (KPLIB_mission_data setVariable [var, val, true])

#ifndef Q
#define Q(x) #x
#endif // QUOTE

#define MVAR(var) LIB##_##MODULE##var
#define MSVAR(var) LIB##_##MODULES##var

#define QMVAR(var) Q(MVAR(var))
#define QMSVAR(var) Q(MSVAR(var))

#define MVAR_F(func) LIB##_fnc_##MODULE##func
#define MSVAR_F(func) LIB##_fnc_##MODULES##func

#define QMVAR_F(func) Q(MVAR_F(func))
#define QMSVAR_F(func) Q(MSVAR_F(func))

#define MSTATUS(stat) LIB##_##MODULE##_status##stat