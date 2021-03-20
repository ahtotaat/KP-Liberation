/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: Michael W. Powell [22nd MEU SOC]
    Created: 2021-03-19 17:20:59
    Last Update: 2021-03-19 17:21:02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class exampleMission {
    file = "modules\0800_missions\missions\999_exampleMission\fnc";

    // Module initialization phase event handler
    class exampleMission_onPreInit {
        preInit = 1;
    };

    // Module initialization phase event handler
    class exampleMission_onPostInit {
        postInit = 1;
    };

    // Returns whether the caller should do some debugging
    class exampleMission_debug {};

    // CBA Settings initialization for this module
    class exampleMission_settings {};

    //
    class exampleMission_onAbortMission {};

    //
    class exampleMission_onEnterMission {};

    //
    class exampleMission_onGetTelemetry {};

    //
    class exampleMission_onMission {};

    //
    class exampleMission_onMissionEntered {};

    //
    class exampleMission_onMissionLeaving {};

    //
    class exampleMission_onMissionSetup {};

    //
    class exampleMission_onMissionTearDown {};
};
