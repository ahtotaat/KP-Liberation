#include "script_component.hpp"
/*
    KP Liberation Custom German Side Preset

    File: custom_Ger.sqf
    Author: Ahto Taat - https://github.com/ahtotaat
    Date: July 15, 2021
    Last Update: July 16, 2021 
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Custom German (Bundeswehr) side preset file for individual adjustments. Most aspects, except Bundeswehr transport
        planes and submarines, are covered.
    
    Mandatory mods, dependencies of each tabulated immediate below:
    - CUP Vehicles (https://steamcommunity.com/sharedfiles/filedetails/?id=541888371)
    - CUP Units (https://steamcommunity.com/workshop/filedetails/?id=497661914)
    - CUP Weapons (https://steamcommunity.com/workshop/filedetails/?id=497660133)
    - CBA_A3 (https://steamcommunity.com/workshop/filedetails/?id=450814997)
    - BWMod (https://steamcommunity.com/workshop/filedetails/?id=1200127537)
    - Eurofighter Typhoon AWS (https://steamcommunity.com/workshop/filedetails/?id=1625724231)
        - FIR AWS(AirWeaponSystem) [no weapons on pylons without] (https://steamcommunity.com/workshop/filedetails/?id=366425329)
    - POOK ARTY Pack (https://steamcommunity.com/sharedfiles/filedetails/?id=1312457117)
        - POOK ARTY Pack - CUP Edition [tiny comp. shim] (https://steamcommunity.com/sharedfiles/filedetails/?id=1312469696)
    - POOK SAM Pack (https://steamcommunity.com/sharedfiles/filedetails/?id=1154375007)
        - POOK SAM Pack - CUP Edition [dependency, tiny comp. shim] (https://steamcommunity.com/sharedfiles/filedetails/?id=1154438735)
        - POOK Camonets (https://steamcommunity.com/workshop/filedetails/?id=943981276)
    - Redd'n'Tank Vehicles (https://steamcommunity.com/sharedfiles/filedetails/?id=1128145626)
    
*/

params [
    ["_isFriendly", false, [false]]
];


/*------------------------------------------------------------
    --- GENERAL SETTINGS ---
    General stuff like side and colors.
------------------------------------------------------------*/

// Name of the used/created army in this preset
KPLIB_PRST_SETVAR("name", "Bundeswehr");

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

KPLIB_PRST_SETVAR("airBuilding", "Land_Radar_Small_F");
KPLIB_PRST_SETVAR("arsenalBox", "B_supplyCrate_F");
KPLIB_PRST_SETVAR("crateAmmo", "B_CargoNet_01_ammo_F");
KPLIB_PRST_SETVAR("crateFuel", "CargoNet_01_barrels_F");
KPLIB_PRST_SETVAR("crateSupply", "CargoNet_01_box_F");
KPLIB_PRST_SETVAR("fobBox", "BWA3_Container_Fleck");
KPLIB_PRST_SETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
KPLIB_PRST_SETVAR("fobTruck", "Redd_Tank_Fuchs_1A4_Pi_Flecktarn");
KPLIB_PRST_SETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
KPLIB_PRST_SETVAR("potato", "CUP_B_CH53E_VIV_GER");
KPLIB_PRST_SETVAR("respawnTruck", "Redd_Tank_Fuchs_1A4_San_Flecktarn");
KPLIB_PRST_SETVAR("slotHeli", "Land_HelipadSquare_F");
KPLIB_PRST_SETVAR("slotJet", "Land_TentHangar_V1_F");
KPLIB_PRST_SETVAR("storageLarge", "ContainmentArea_01_sand_F");
KPLIB_PRST_SETVAR("storageSmall", "ContainmentArea_02_sand_F");


/*------------------------------------------------------------
    --- ADDITIONAL MECHANICS CLASSNAMES ---
    Classnames of additional mechanics/functionalities in the mission.
    The entered classnames can be reused somewhere else in the preset.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("addBoat", "B_Boat_Transport_01_F");
KPLIB_PRST_SETVAR("addRotaryLight", "CUP_B_UH1Y_UNA_USMC");
KPLIB_PRST_SETVAR("addRotaryUnarmed", "CUP_B_CH53E_GER");
KPLIB_PRST_SETVAR("addRotaryArmed", "BWA3_Tiger_RMK_Heavy");
KPLIB_PRST_SETVAR("addGroundLight", "CUP_B_FENNEK_GER_Wdl");
KPLIB_PRST_SETVAR("addGroundArmed", "CUP_B_Boxer_HMG_GER_WDL");
KPLIB_PRST_SETVAR("addGroundArmored", "BWA3_Dingo2_FLW100_MG3_CG13_Fleck");
KPLIB_PRST_SETVAR("logiTruck", "rnt_lkw_5t_mil_gl_kat_i_transport_fleck");
KPLIB_PRST_SETVAR("mortar", "BWA3_MRS120_Fleck");
KPLIB_PRST_SETVAR("staticAntiAir", "pook_MIM104_PAC2_Base");
KPLIB_PRST_SETVAR("staticAntiAirBig", "pook_MIM104_PAC3_Base");
KPLIB_PRST_SETVAR("staticAntiAirBigRadar", "POOK_ANMPQ53_Base");
KPLIB_PRST_SETVAR("staticAntiTank", "B_static_AT_F");
KPLIB_PRST_SETVAR("turretShortRangeSam", "B_SAM_System_01_F");
KPLIB_PRST_SETVAR("turretMediumRangeSam", "B_SAM_System_02_F");
KPLIB_PRST_SETVAR("turretPhalanxMinigun", "B_AAA_System_01_F");
KPLIB_PRST_SETVAR("turretGun", "B_Ship_Gun_01_F");
KPLIB_PRST_SETVAR("turretVls", "B_Ship_MRLS_01_F");
KPLIB_PRST_SETVAR("longRangeSam", "B_SAM_System_03_F");
KPLIB_PRST_SETVAR("longRangeRadar", "B_Radar_System_01_F");


/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("rsAntiAir", "BWA3_RiflemanAA_Fliegerfaust_Fleck");
KPLIB_PRST_SETVAR("rsAntiTank", "BWA3_RiflemanAT_PzF3_Fleck");
KPLIB_PRST_SETVAR("rsAutorifleMan", "BWA3_MachineGunner_MG5_Fleck");
KPLIB_PRST_SETVAR("rsCrewmanHeli", "BWA3_Crew_Fleck");
KPLIB_PRST_SETVAR("rsCrewmanVeh", "BWA3_Crew_Fleck");
KPLIB_PRST_SETVAR("rsEngineer", "BWA3_Engineer_Fleck");
KPLIB_PRST_SETVAR("rsGrenadier", "BWA3_Grenadier_G27_Fleck");
KPLIB_PRST_SETVAR("rsHeavyGunner", "BWA3_MachineGunner_MG3_Fleck");
KPLIB_PRST_SETVAR("rsPilotHeli", "BWA3_Helipilot");
KPLIB_PRST_SETVAR("rsPilotJet", "FIR_FighterPilot_Type1");
KPLIB_PRST_SETVAR("rsLightAt", "BWA3_RiflemanAT_RGW90_Fleck");
KPLIB_PRST_SETVAR("rsMarksman", "BWA3_Marksman_Fleck");
KPLIB_PRST_SETVAR("rsMedic", "BWA3_Medic_Fleck");
KPLIB_PRST_SETVAR("rsOfficer", "BWA3_Officer_Fleck");
KPLIB_PRST_SETVAR("rsRifleman", "BWA3_Rifleman_Fleck");
KPLIB_PRST_SETVAR("rsSharpshooter", "BWA3_Marksman_Fleck");
KPLIB_PRST_SETVAR("rsSquadLeader", "BWA3_SL_Fleck");
KPLIB_PRST_SETVAR("rsSurvivor", "BWA3_Rifleman_unarmed_Fleck");
KPLIB_PRST_SETVAR("rsTeamLeader", "BWA3_TL_Fleck");


/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

KPLIB_PRST_SETVAR("sfDiver", "B_diver_F");
KPLIB_PRST_SETVAR("sfExplosive", "BWA3_recon_Pioneer_Fleck");
KPLIB_PRST_SETVAR("sfLightAt", "BWA3_recon_LAT_Fleck");
KPLIB_PRST_SETVAR("sfMarksman", "BWA3_recon_Marksman_Fleck");
KPLIB_PRST_SETVAR("sfMedic", "BWA3_recon_Medic_Fleck");
KPLIB_PRST_SETVAR("sfRifleman", "BWA3_recon_Fleck");
KPLIB_PRST_SETVAR("sfSharpshooter", "BWA3_recon_Marksman_Fleck");
KPLIB_PRST_SETVAR("sfSniper", "CUP_B_GER_Fleck_Soldier_Sniper");
KPLIB_PRST_SETVAR("sfSpotter", "BWA3_Spotter_Fleck");
KPLIB_PRST_SETVAR("sfTeamLeader", "BWA3_TL_Fleck");



/*------------------------------------------------------------
    --- BUILDABLE OBJECTS ARRAYS ---
    The arrays below are used to determine what can be build.
    Format: "classname", supplies, ammunition, fuel
    Example: KPLIB_PRST_CAT_ADD("vehLightUnarmed", "B_MRAP_01_F", 100, 0, 50);
    The above example adds the NATO Hunter MRAP to the unarmed light vehicles list
    with the costs of 100 supplies, 0 ammunition and 50 fuel.
------------------------------------------------------------*/

// Infantry units
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

// Special Forces units
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

// Light vehicles (unarmed)
KPLIB_PRST_CAT_BEGIN("vehLightUnarmed");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "BWA3_Eagle_Fleck",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "CUP_B_Boxer_Empty_GER_WDL",             0,    0,    0);
KPLIB_PRST_CAT_END("vehLightUnarmed");

// Light vehicles (armed)
KPLIB_PRST_CAT_BEGIN("vehLightArmed");
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Eagle_FLW100_Fleck",                75,   40,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Dingo2_FLW100_MG3_Fleck",           75,   50,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Dingo2_FLW200_GMW_Fleck",          100,   40,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Dingo2_FLW200_GMW_CG13_Fleck",     100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Dingo2_FLW200_M2_CG13_Fleck",      100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "BWA3_Dingo2_FLW100_MG3_CG13_Fleck",     100,   60,   50);
KPLIB_PRST_CAT_ADD("vehLightArmed", "Redd_Tank_Wiesel_1A4_MK20_Flecktarn",   200,  200,  100);
KPLIB_PRST_CAT_ADD("vehLightArmed", "Redd_Tank_Wiesel_1A2_TOW_Flecktarn",    200,  200,  100);
KPLIB_PRST_CAT_ADD("vehLightArmed", "rnt_sppz_2a2_luchs_flecktarn",          200,  300,  200);
KPLIB_PRST_CAT_ADD("vehLightArmed", "Redd_Marder_1A5_Flecktarn",             300,  300,  300);
KPLIB_PRST_CAT_END("vehLightArmed");

// Transport trucks
KPLIB_PRST_CAT_BEGIN("vehTrans");
KPLIB_PRST_CAT_ADD("vehTrans", "rnt_lkw_5t_mil_gl_kat_i_transport_fleck",    125,    0,   75);
KPLIB_PRST_CAT_ADD("vehTrans", "rnt_lkw_7t_mil_gl_kat_i_transport_fleck",    125,    0,   75);
KPLIB_PRST_CAT_END("vehTrans");

// Boats
KPLIB_PRST_CAT_BEGIN("boats");
KPLIB_PRST_CAT_ADD("boats", "B_Boat_Transport_01_F",                         100,    0,   25);
KPLIB_PRST_CAT_ADD("boats", "B_Boat_Armed_01_minigun_F",                     200,   80,   75);
KPLIB_PRST_CAT_ADD("boats", "B_SDV_01_F",                                     50,    0,   50);
KPLIB_PRST_CAT_END("boats");

// APCs
KPLIB_PRST_CAT_BEGIN("vehHeavyApc");
KPLIB_PRST_CAT_ADD("vehHeavyApc", "BWA3_Puma_Fleck",                           400, 600, 500);  
KPLIB_PRST_CAT_END("vehHeavyApc");

// Heavy vehicles
KPLIB_PRST_CAT_BEGIN("vehHeavy");
KPLIB_PRST_CAT_ADD("vehHeavy", "BWA3_Leopard2_Fleck",                        600, 1250,  300);
KPLIB_PRST_CAT_END("vehHeavy");

// Anti Air vehicles
KPLIB_PRST_CAT_BEGIN("vehAntiAir");
KPLIB_PRST_CAT_ADD("vehAntiAir", "Redd_Tank_Gepard_1A2_Flecktarn",             500, 200, 100);
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_NASAMS_BASE",                          500, 1000, 100);
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_CRAM_base",                            500, 1000, 100);
KPLIB_PRST_CAT_ADD("vehAntiAir", "pook_MEADS_base",                           500, 1000, 100);
KPLIB_PRST_CAT_END("vehAntiAir");

// Artillery vehicles
KPLIB_PRST_CAT_BEGIN("vehArty");
KPLIB_PRST_CAT_ADD("vehArty", "pook_M777_GER",                               600, 1250,  300);
KPLIB_PRST_CAT_ADD("vehArty", "pook_1L220UK_GER",                            800, 1750,  400);
KPLIB_PRST_CAT_END("vehArty");

// Transport Helicopters
KPLIB_PRST_CAT_BEGIN("heliTrans");
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_B_UH1D_GER_KSK",                        200,    0,  100);
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_B_CH53E_GER",                           250,   80,  150);
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_B_UH1D_slick_GER_KSK",                  250,   80,  150);
KPLIB_PRST_CAT_ADD("heliTrans", "CUP_B_UH1D_armed_GER_KSK",                  300,   80,  175);
KPLIB_PRST_CAT_END("heliTrans");

// Attack Helicopters
KPLIB_PRST_CAT_BEGIN("heliAttack");
KPLIB_PRST_CAT_ADD("heliAttack", "BWA3_Tiger_RMK_FZ",                        500,  400,  200);
KPLIB_PRST_CAT_ADD("heliAttack", "BWA3_Tiger_RMK_Universal",                 500,  400,  200);
KPLIB_PRST_CAT_ADD("heliAttack", "BWA3_Tiger_RMK_PARS",                      500,  400,  200);
KPLIB_PRST_CAT_ADD("heliAttack", "BWA3_Tiger_RMK_Heavy",                     500,  400,  200);
KPLIB_PRST_CAT_END("heliAttack");

// Transport Planes
KPLIB_PRST_CAT_BEGIN("planeTrans");
KPLIB_PRST_CAT_END("planeTrans");

// Jets
KPLIB_PRST_CAT_BEGIN("jets");
KPLIB_PRST_CAT_ADD("jets", "EAWS_EF2000_GER_CAP",                           1000,  800,  400);
KPLIB_PRST_CAT_END("jets");

// Static Defenses
KPLIB_PRST_CAT_BEGIN("statics");
KPLIB_PRST_CAT_ADD("statics", "CUP_B_M2StaticMG_GER_Fleck",                   25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "rnt_mg3_static",                               25,   40,    0);
KPLIB_PRST_CAT_ADD("statics", "BWA3_MRS120_Fleck",                            35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "Redd_Milan_Static",                            35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "rnt_mantis_base",                              35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", "rnt_mantis_radar",                             35,   60,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiAir"),             50,  100,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiTank"),            50,  100,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("mortar"),                    80,  150,    0);
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAntiAirBig"),         250,  300,    0);
KPLIB_PRST_CAT_END("statics");

// Logistic/Utility vehicles and objects
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
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("staticAntiAirBigRadar"),   250,    0,    0);    // AN/MPQ-105 Radar
KPLIB_PRST_CAT_ADD("logistic", "rnt_lkw_10t_mil_gl_kat_i_repair_fleck",      325,    0,   75);
KPLIB_PRST_CAT_ADD("logistic", "rnt_lkw_5t_mil_gl_kat_i_fuel_fleck",         125,    0,  275);
KPLIB_PRST_CAT_ADD("logistic", "rnt_lkw_7t_mil_gl_kat_i_mun_fleck",          125,  200,   75);
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Repair_F",                    275,    0,    0);    // Huron Repair Container
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Fuel_F",                       75,    0,  200);    // Huron Fuel Container
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Ammo_F",                       75,  200,    0);    // Huron Ammo Container
KPLIB_PRST_CAT_END("logistic");

// Decorative Objects
KPLIB_PRST_CAT_BEGIN("deco");
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_House_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Patrol_V1_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Tower_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_NATO_F",                                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_US_F",                                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_UK_F",                                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_White_F",                                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_house_V1_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_HQ_V1_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_RedCrystal_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_open_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_big_F",                             0,    0,    0);
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
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_gerade",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_t",                                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_stand",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_stellung",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_ende",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_ecke",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "rnt_graben_bunker",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "pook_camonet_vehtruck_west6",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "pook_camonet_vehtruck_east6",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "pook_camonet_vehtruck_west7",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "pook_camonet_vehtruck_east7",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "BWA3_Flag_Germany",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "FIR_ATMS_Laptop",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "FIR_Baseplate",                                    0,    0,    0);
KPLIB_PRST_CAT_END("deco");


/*------------------------------------------------------------
    --- LOCKED VEHICLE CLASSNAMES ---
    Classnames of vehicles which shouldn't be available from the start.
    The listed classnames have to be also listed in one of the build categories above.
    You can leave this category empty, but leave the line with BEGIN untouched.
------------------------------------------------------------*/

KPLIB_PRST_CAT_BEGIN("lockedVehPl");
//(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_Plane_Fighter_01_Stealth_F";


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checked"), true];
