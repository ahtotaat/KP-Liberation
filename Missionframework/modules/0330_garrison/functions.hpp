/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class garrison {
    file = "modules\0330_garrison\fnc";

    // Add infantry to sector garrison
    class garrison_addInfantry {};

    // Add light vehicle to sector garrison
    class garrison_addVeh {};

    // Changes the owner of a sector garrison
    class garrison_changeOwner {};

    // Remove given vehicle from sector garrison
    class garrison_delVeh {};

    // Despawns the sector garrison and updates the garrison array with actual data
    class garrison_despawn {};

    // Handle button click for unit/group adding
    class garrison_dialogAdd {};

    // Handle button click of infantry/vehicle removal
    class garrison_dialogRemove {};

    // Handle group selection in garrison dialog
    class garrison_dialogSelectGroup {};

    // Handle new selection in garrison dialog
    class garrison_dialogSelectSector {};

    // Handle unit selection in garrison dialog
    class garrison_dialogSelectUnit {};

    // Gets the specific garrison array
    class garrison_getGarrison {};

    // Finds empty position suitable for vehicle spawn
    class garrison_getVehSpawnPos {};

    // Initializes a sector garrison
    class garrison_initSector {};

    // Loads module specific data from the save
    class garrison_loadData {};

    // Opens the garrison dialog
    class garrison_openDialog {};

    // Module post initialization
    class garrison_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class garrison_preInit {
        preInit = 1;
    };

    // Reinitializes sectors
    class garrison_reInitSectors {};

    // Saves module specific data for the save
    class garrison_saveData {};

    // Spawns the garrison upon sector activation
    class garrison_spawn {};

    // Spawns garrison infantry at a sector
    class garrison_spawnSectorInfantry {};

    // Spawns a vehicle at a sector
    class garrison_spawnSectorVehicle {};
};
