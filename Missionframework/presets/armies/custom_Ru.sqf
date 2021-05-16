#include "script_component.hpp"
/*
    KP Liberation Custom Russian preset

    File: custom_Ru.sqf
    Author: github.com/ahtotaat
    Date: 2018-11-24
    Last Update: 2021-05-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Custom Russian preset aiming to offer 'complete experience' of vehicles and weaponry.
        Preset is based on following free mods:
            - CUP Vehicles.
            - CUP Units.
            - CUP Weapons.
            - POOK Artillery Pack.
            - POOK SAM Pack.
                - POOK Camonets Mod (dependency).
                - CBA_A3 (dependency)
                - POOK Artillery pack CUP Edition (tiny compatibility shim for CUP)

    POOK mods include custom-modeled equipment partially or completely lacking in large "all-in
    -one" mods like CUP or RHS. Combined with CUP, selection becomes far more extensive than one
    offered by RHS, without introducing incompatible damage model.
*/

params [
    ["_isFriendly", false, [false]]
];


/*------------------------------------------------------------
    --- GENERAL SETTINGS ---
    General stuff like side and colors.
------------------------------------------------------------*/

// Name of the used/created army in this preset
KPLIB_PRST_SETVAR("name", "Russian Expedition Forces");

// Military alphabet
KPLIB_PRST_CAT_BEGIN("alphabet");
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Alpha";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Bravo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Charlie";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Delta";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Echo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Foxtrot";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Golf";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Hotel";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "India";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Juliet";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Kilo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Lima";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Mike";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "November";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Oscar";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Papa";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Quebec";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Romeo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Sierra";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Tango";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Uniform";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Victor";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Whiskey";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "X-Ray";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Yankee";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Zulu";


/*------------------------------------------------------------
    --- IMPORTANT UNIQUE CLASSNAMES ---
    Each of these has to be unique.
    Don't use any of the entered classnames anywhere else in the preset.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("airBuilding", "pook_30N6E_mast"); // 30N6E radar mast (NATO design: SA-10)
KPLIB_PRST_SETVAR("arsenalBox", "O_supplyCrate_F");
KPLIB_PRST_SETVAR("crateAmmo", "O_CargoNet_01_ammo_F");
KPLIB_PRST_SETVAR("crateFuel", "CargoNet_01_barrels_F");
KPLIB_PRST_SETVAR("crateSupply", "CargoNet_01_box_F");
KPLIB_PRST_SETVAR("fobBox", "Land_Pod_Heli_Transport_04_box_F");
KPLIB_PRST_SETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
KPLIB_PRST_SETVAR("fobTruck", "O_Truck_03_device_F");
KPLIB_PRST_SETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
KPLIB_PRST_SETVAR("potato", "O_Heli_Transport_04_F");
KPLIB_PRST_SETVAR("respawnTruck", "O_Truck_03_medical_F");
KPLIB_PRST_SETVAR("slotHeli", "Land_HelipadSquare_F");
KPLIB_PRST_SETVAR("slotJet", "Land_TentHangar_V1_F");
KPLIB_PRST_SETVAR("storageLarge", "ContainmentArea_01_sand_F");
KPLIB_PRST_SETVAR("storageSmall", "ContainmentArea_02_sand_F");


/*------------------------------------------------------------
    --- ADDITIONAL MECHANICS CLASSNAMES ---
    Classnames of additional mechanics/functionalities in the mission.
    The entered classnames can be reused somewhere else in the preset.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("addBoat", "CUP_O_ZUBR_RU");
KPLIB_PRST_SETVAR("addRotaryLight", "CUP_O_Ka60_Grey_RU");
KPLIB_PRST_SETVAR("addRotaryUnarmed", "CUP_O_Mi8AMT_RU");
KPLIB_PRST_SETVAR("addRotaryArmed", "CUP_O_Ka50_DL_RU");
KPLIB_PRST_SETVAR("addGroundLight", "CUP_O_UAZ_Unarmed_RU");
KPLIB_PRST_SETVAR("addGroundArmed", "CUP_O_GAZ_Vodnik_KPVT_RU"); // Vodnik (KPVT)
KPLIB_PRST_SETVAR("addGroundArmored", "CUP_O_GAZ_Vodnik_Unarmed_RU"); // Vodnik, unarmed
KPLIB_PRST_SETVAR("logiTruck", "CUP_O_Kamaz_Open_RU"); // KamAZ 5350 (Open)
KPLIB_PRST_SETVAR("mortar", "CUP_O_2b14_82mm_RU");
KPLIB_PRST_SETVAR("staticAntiAir", "pook_KS19_base");
KPLIB_PRST_SETVAR("staticAntiAirBig", "pook_SA21_spawnerOPFOR");
KPLIB_PRST_SETVAR("staticAntiAirBigRadar", "pook_64N6E_DRAB"); // 64N6E radar system
KPLIB_PRST_SETVAR("staticAntiTank", "CUP_O_D30_AT_RU");
KPLIB_PRST_SETVAR("longRangeSam", "pook_SA21_static_base");
KPLIB_PRST_SETVAR("longRangeRadar", "pook_64N6E_DRAB");

/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("rsAntiAir", "CUP_O_RU_Soldier_AA_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsAntiTank", "CUP_O_RU_Soldier_HAT_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsAutorifleMan", "CUP_O_RU_Soldier_AR_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsCrewmanHeli", "CUP_O_RU_Pilot_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsCrewmanVeh", "CUP_O_RU_Crew_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsEngineer", "CUP_O_RU_Engineer_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsGrenadier", "CUP_O_RU_Soldier_GL_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsHeavyGunner", "CUP_O_RU_Soldier_MG_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsPilotHeli", "CUP_O_RU_Pilot_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsPilotJet", "CUP_O_RU_Pilot_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsLightAt", "CUP_O_RU_Soldier_LAT_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsMarksman", "CUP_O_RU_Soldier_Marksman_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsMedic", "CUP_O_RU_Medic_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsOfficer", "CUP_O_RU_Officer_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsParatrooper", "CUP_O_RU_Spotter_VDV_M_EMR"); //Putting random VDV asset to it. VDV are paratroopers, all of them.
KPLIB_PRST_SETVAR("rsRifleman", "CUP_O_RU_Soldier_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsSharpshooter", "CUP_O_RU_Sniper_KSVK_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsSquadLeader", "CUP_O_RU_Soldier_SL_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsSurvivor", "CUP_O_RU_Soldier_Saiga_VDV_M_EMR");
KPLIB_PRST_SETVAR("rsTeamLeader", "CUP_O_RU_Soldier_TL_VDV_M_EMR");

/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("sfDiver", "O_diver_F");
KPLIB_PRST_SETVAR("sfExplosive", "CUP_O_RUS_Saboteur");
KPLIB_PRST_SETVAR("sfLightAt", "CUP_O_RUS_Soldier_GL");
KPLIB_PRST_SETVAR("sfMarksman", "CUP_O_RUS_Soldier_Marksman");
KPLIB_PRST_SETVAR("sfMedic", "CUP_O_RUS_SpecOps");
KPLIB_PRST_SETVAR("sfRifleman", "CUP_O_RUS_SpecOps");
KPLIB_PRST_SETVAR("sfSharpshooter", "CUP_O_RUS_Soldier_Marksman");
KPLIB_PRST_SETVAR("sfSniper", "CUP_O_RUS_Soldier_Marksman");
KPLIB_PRST_SETVAR("sfSpotter", "CUP_O_RUS_SpecOps_Scout");
KPLIB_PRST_SETVAR("sfTeamLeader", "CUP_O_RUS_Commander");

/*------------------------------------------------------------
    --- BUILDABLE OBJECTS ARRAYS ---
    The arrays below are used to determine what can be build.
    Format: "classname", supplies, ammunition, fuel
    Example: KPLIB_PRST_CAT_ADD("lVeh", "B_MRAP_01_F", 100, 0, 50);
    The above example adds the NATO Hunter MRAP to the light vehicles list
    with the costs of 100 supplies, 0 ammunition and 50 fuel.
------------------------------------------------------------*/

KPLIB_PRST_CAT_BEGIN("units");
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsRifleman"),                  20,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsLightAt"),                   30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsGrenadier"),                 25,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAutorifleMan"),              25,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsHeavyGunner"),               35,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsMarksman"),                  30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAntiTank"),                  50,   10,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAntiAir"),                   50,   10,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsMedic"),                     30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsEngineer"),                  30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsParatrooper"),               20,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsCrewmanVeh"),                10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsCrewmanHeli"),               10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsPilotHeli"),                 10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsPilotJet"),                  10,    0,    0);
KPLIB_PRST_CAT_END("units");

KPLIB_PRST_CAT_BEGIN("specOps");
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfRifleman"),                50,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfLightAt"),                 80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfMarksman"),                80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfMedic"),                   80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfExplosive"),               80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSpotter"),                 80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSharpshooter"),            85,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSniper"),                 100,   10,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfDiver"),                  100,    0,    0);
KPLIB_PRST_CAT_END("specOps");

KPLIB_PRST_CAT_BEGIN("vehLightUnarmed");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "CUP_O_UAZ_Open_RU",                     50,    0,   25);
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "CUP_O_UAZ_Unarmed_RU",                  50,    0,   25);
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "CUP_O_MTLB_pk_Green_RU",                75,    0,   75);
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "CUP_O_GAZ_Vodnik_Unarmed_RU",           75     0,   50);
KPLIB_PRST_CAT_END("vehLightUnarmed");

KPLIB_PRST_CAT_BEGIN("vehLightArmed");
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BRDM2_HQ_RUS",                       75,   40,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BRDM2_RUS",                          75,   50,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BRDM2_ATGM_RUS",                    100,   40,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_GAZ_Vodnik_BPPU_RU",                100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BTR90_HQ_RU",                       100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BTR60_RU",                          100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BTR80_CAMO_RU",                     100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BTR80A_GREEN_RU",                   100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "CUP_O_BTR90_RU",                          100,   60,   50);
KPLIB_PRST_CAT_END("vehLightArmed");

KPLIB_PRST_CAT_BEGIN("vehTrans");
KPLIB_PRST_CAT_ADD("vehTrans", "CUP_O_Kamaz_RU",                               125,    0,   75);
KPLIB_PRST_CAT_ADD("vehTrans", "CUP_O_Kamaz_Open_RU",                          125,    0,   75);
KPLIB_PRST_CAT_ADD("vehTrans", "CUP_O_Ural_RU",                                125,    0,   75);
KPLIB_PRST_CAT_ADD("vehTrans", "CUP_O_Ural_Open_RU",                           125,    0,   75);
KPLIB_PRST_CAT_END("vehTrans");

// Boats
KPLIB_PRST_CAT_BEGIN("boats");
KPLIB_PRST_CAT_ADD("boats", "CUP_O_PBX_RU",                                    100,    0,   25);
KPLIB_PRST_CAT_ADD("boats", "CUP_O_ZUBR_RU",                               2000,   800,   2000); // ZUBR armed heavy hovercraft
KPLIB_PRST_CAT_END("boats");

// APCs
KPLIB_PRST_CAT_BEGIN("vehHeavyApc");
KPLIB_PRST_CAT_ADD("vehHeavyApc", "CUP_O_BMP2_RU",                           100,   60,   150);
KPLIB_PRST_CAT_ADD("vehHeavyApc", "CUP_O_BMP_HQ_RU",                         100,   60,   150);
KPLIB_PRST_CAT_ADD("vehHeavyApc", "CUP_O_BMP3_RU",                           100,   60,   150);
KPLIB_PRST_CAT_END("vehHeavyApc");

// Heavy vehicles
KPLIB_PRST_CAT_BEGIN("vehHeavy");
KPLIB_PRST_CAT_ADD("vehHeavy", "CUP_O_T72_RU",                                300,  250,  180);
KPLIB_PRST_CAT_ADD("vehHeavy", "CUP_O_T90_RU",                                400,  300,  200);
KPLIB_PRST_CAT_END("vehHeavy");

// Anti Air vehicles
KPLIB_PRST_CAT_BEGIN("vehAntiAir");
KPLIB_PRST_CAT_ADD("vehAntiAir", "CUP_O_UAZ_AA_RU",                           300,  250,  175); // Uaz-469 (Igla AA missiles)
KPLIB_PRST_CAT_ADD("vehAntiAir", "CUP_O_Ural_ZU23_RU",                        300,  250,  175); // Ural (ZU-23)
KPLIB_PRST_CAT_ADD("vehAntiAir", "CUP_O_2S6_RU",                              300,  250,  175); // 2S6 "Tunguska"
KPLIB_PRST_CAT_ADD("vehAntiAir", "CUP_O_2S6M_RU",                             300,  250,  175); // 2S6M "Tunguska-M"
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_ZSU_base",                             300,  250,  175); // ZSU-23-4 "Shilka" (base model)
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_ZSUM4_base",                           300,  250,  175); // ZSU-23-4 "Shilka M4" (M4 upgrade)
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_9K331_Root",                           300,  250,  175); // 9K331 "Tor-M1"
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_9K332_Root",                           300,  250,  175); // 9K331 "Tor-M1"
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_96K6_root",                            300,  250,  175); // 96K6 "Pantsir-S1"
KPLIB_PRST_CAT_END("vehAntiAir");

// Artillery vehicles
KPLIB_PRST_CAT_BEGIN("vehArty");
KPLIB_PRST_CAT_ADD("vehArty", "pook_MZKT_AMMO_RU",                            600, 1250,  300); // MZKT ammo resupply vehicle
KPLIB_PRST_CAT_ADD("vehArty", "pook_1B75_RU",                                 600, 1250,  300); // 1B75 "Penicillin" mobile counter-battery radar system
KPLIB_PRST_CAT_ADD("vehArty", "pook_2S1_RU",                                  600, 1250,  300); // 2S1 "Gvozdika" 122mm self-propelled howitzer
KPLIB_PRST_CAT_ADD("vehArty", "pook_2S3_RU",                                  600, 1250,  300); // 2S3 "Akatsiya" 152mm self-propelled howitzer
KPLIB_PRST_CAT_ADD("vehArty", "pook_2S5_RU",                                  600, 1250,  300); // 2S5 "Giatsint-S" 152mm self-propelled howitzer
KPLIB_PRST_CAT_ADD("vehArty", "pook_2S19_RU",                                 600, 1250,  300); // 2S19 "Msta-S" 152mm self-propelled howitzer
KPLIB_PRST_CAT_ADD("vehArty", "CUP_O_BM21_RU",                                600, 1250,  300); // BM-21 "Grad" 122mm MLRS
KPLIB_PRST_CAT_ADD("vehArty", "pook_TOS1A_RU",                                600, 1250,  300); // TOS-1A "Buratino" self-propelled 220mm MLRS
KPLIB_PRST_CAT_ADD("vehArty", "pook_A222_RU",                                 600, 1250,  300); // A-222 "Bereg" 130mm self-propelled coastal artillery
KPLIB_PRST_CAT_ADD("vehArty", "pook_3K60_RU",                                 600, 1250,  300); // 3K60 "Bal" coastal missile system (eight Kh-35 cruise missiles)
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K57_RU",                                 600, 1250,  300); // 9K57 "Uragan" 220mm MLRS
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K57M_RU",                                600, 1250,  300); // 9K57M "Uragan-M" 220mm MLRS
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K58_RU",                                 600, 1250,  300); // 9K58 "Smerch" 300mm MLRS
KPLIB_PRST_CAT_ADD("vehArty", "pook_K300P_RU",                                600, 1250,  300); // K-300P "Bastion-P" mobile anti-ship missile system 
KPLIB_PRST_CAT_ADD("vehArty", "pook_4K51_RU",                                 600, 1250,  300); // 4K51 "Rubezh" mobile anti-ship missile system
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K52_RU",                                 600, 1250,  300); // 9K52 "Luna-M" short-range rocket artillery system
KPLIB_PRST_CAT_ADD("vehArty", "pook_SCUD_RU",                                 600, 1250,  300); // 9K72 "Elbrus" tactical ballistic missile system
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K720_RU",                                600, 1250,  300); // 9K720 "Iskander" short range ballistic missile system
KPLIB_PRST_CAT_ADD("vehArty", "pook_9K720K_RU",                               600, 1250,  300); // 9K720K "Iskander-K" short range ballistic missile system
KPLIB_PRST_CAT_END("vehArty");

// Transport Helicopters
KPLIB_PRST_CAT_BEGIN("heliTrans");
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_O_Mi8_VIV_RU",                           200,    0,  100); // Mi-8 VIV
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_O_Mi8AMT_RU",                            250,    0,  150); // Mi-8AMT
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_O_Mi8_medevac_RU",                       275,    0,  175); // Mi-8 Medevac
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_O_MI6T_RU",                              300,    0,  175); // Mi-6T heavy transport
KPLIB_PRST_CAT_END("heliTrans");

// Attack Helicopters
KPLIB_PRST_CAT_BEGIN("heliAttack");
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Mi8_RU",                              250,  100,  150); // Mi-8MTV3 rocket pods (4 pods of S5 + 3 x 7.62mm PK LMG's)
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Ka60_Grey_RU",                        500,  400,  200); // Ka-60 rocket pods (2 pods of S5)
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Mi24_V_Dynamic_RU",                   250,  100,  150); // Mi-24V "Hind"
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Mi24_P_Dynamic_RU",                   500,  400,  200); // Mi-24P "Hind" ( "V" has 12.7mm HMG, "P" has 30mm dual autocannons)
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Ka50_DL_RU",                          250,  100,  150); // Ka-50 "Black Shark"
KPLIB_PRST_CAT_ADD("heliAttack", "CUP_O_Ka52_RU",                             500,  400,  200); // Ka-52 "Alligator" ( "50" is single-seater + heavier hull armor, "52" is two-seater)
KPLIB_PRST_CAT_END("heliAttack");

// Transport Planes
KPLIB_PRST_CAT_BEGIN("planeTrans");
KPLIB_PRST_CAT_END("planeTrans");

// Jets
KPLIB_PRST_CAT_BEGIN("jets");
KPLIB_PRST_CAT_ADD("jets", "CUP_O_Su25_Dyn_RU",                              1000,  800,  400); // Su-25 (CAS)
KPLIB_PRST_CAT_ADD("jets", "CUP_O_SU34_RU",                                  1500, 1750,  450); // Su-34 (CAP)
KPLIB_PRST_CAT_END("jets");

// Static Defenses
KPLIB_PRST_CAT_BEGIN("statics");
KPLIB_PRST_CAT_ADD("statics", "CUP_O_D30_AT_RU",                               25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_D30_RU",                                  25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_KORD_RU",                                 35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_Igla_AA_pod_RU",                          35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_AGS_RU",                                  25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_KORD_high_RU",                            25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_Metis_RU",                                35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_Kornet_RU",                               35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "CUP_O_ZU23_RU",                                 25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiAir"),              50,  100,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiTank"),             50,  100,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("mortar"),                     80,  150,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiAirBig"),          250,  300,    0);
KPLIB_PRST_CAT_END("statics");

// Logistic vehicles and objects
KPLIB_PRST_CAT_BEGIN("logistic");
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("arsenalBox"),              100,  200,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("respawnTruck"),            200,    0,  100);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("fobBox"),                  300,  500,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("fobTruck"),                300,  500,   75);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("storageSmall"),              0,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("storageLarge"),              0,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("logiBuilding"),            250,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("airBuilding"),            1000,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("slotHeli"),                250,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("slotJet"),                 500,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("staticAntiAirBigRadar"),   250,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", "pook_MZKT_AMMO_RU",                          325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Kamaz_Reammo_RU",                      325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Ural_Reammo_RU",                       325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Kamaz_Repair_RU",                      325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Ural_Repair_RU",                       325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Kamaz_Refuel_RU",                      325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Ural_Refuel_RU",                       325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "CUP_O_Kamaz_Open_RU",                        325,    0,   75);
KPLIB_PRST_CAT_END("logistic");

// Decorative Objects
KPLIB_PRST_CAT_BEGIN("deco");
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_House_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Patrol_V1_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Tower_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_CSAT_F",                                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_Viper_F",                                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_White_F",                                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_house_V1_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_HQ_V1_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_RedCrystal_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_OPFOR_F",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_OPFOR_open_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_OPFOR_big_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PortableLight_single_F",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PortableLight_double_F",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampSolar_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampHalogen_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampStreet_small_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampAirport_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HelipadCircle_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HelipadRescue_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_blue_F",                   0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_green_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_red_F",                    0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingChair_V1_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingChair_V2_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingTable_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_altis_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_stratis_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_seismic_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Pallet_MilBoxes_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_open_empty_F",                       0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_open_full_F",                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_closed_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_DieselGroundPowerUnit_01_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_ToolTrolley_02_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Workbench_01_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_blue_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_khaki_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_yellow_F",                         0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_02_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BarrelWater_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BarrelWater_grey_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_WaterBarrel_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_WaterTank_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Round_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Short_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Long_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Corner_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_End_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Small_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Large_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Tower_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_1_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_3_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_5_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall4_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall6_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall_corner_F",                       0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall_corridor_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierTower_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncBarrierMedium_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncBarrierMedium4_F",                         0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Concrete_SmallWall_4m_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Concrete_SmallWall_8m_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncShelter_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncWall1_F",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncWall4_F",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilitaryArea_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilAreaSmall_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilitaryVehicles_F",              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Razorwire_F",                                 0,    0,    0);
KPLIB_PRST_CAT_END("deco");


/*------------------------------------------------------------
    --- LOCKED VEHICLE CLASSNAMES ---
    Classnames of vehicles which shouldn't be available from the start.
    The listed classnames have to be also listed in one of the build categories above.
    You can leave this category empty, but leave the line with BEGIN untouched.
------------------------------------------------------------*/

KPLIB_PRST_CAT_BEGIN("lockedVehPl");
//(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "O_MBT_04_cannon_F";


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checked"), true];
