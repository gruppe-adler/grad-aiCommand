#include "script_component.hpp"

if (isNil QGVAR(canReceiveCommandsDefault)) then {
    GVAR(canReceiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canReceiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canGiveCommandsDefault)) then {
    GVAR(canGiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canGiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canUseHighcommandDefault)) then {
    GVAR(canUseHighcommandDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canUseHighcommandDefault"),"number",0] call CBA_fnc_getConfigEntry) == 1;
};

if (isNil QGVAR(onMapOpenend)) then {
    GVAR(onMapOpenend) = compile ([missionConfigFile >> "CfgGradAICommand","onMapOpenend",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onGroupSelected)) then {
    GVAR(onGroupSelected) = compile ([missionConfigFile >> "CfgGradAICommand","onGroupSelected",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onGroupUnselected)) then {
    GVAR(onGroupUnselected) = compile ([missionConfigFile >> "CfgGradAICommand","onGroupUnselected",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointSelected)) then {
    GVAR(onWaypointSelected) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointSelected",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCreated)) then {
    GVAR(onWaypointCreated) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCreated",""] call BIS_fnc_returnConfigEntry);
};


if (isNil QGVAR(onWaypointCustom1Action)) then {
    GVAR(onWaypointCustom1Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom1Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom2Action)) then {
    GVAR(onWaypointCustom2Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom2Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom3Action)) then {
    GVAR(onWaypointCustom3Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom3Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom4Action)) then {
    GVAR(onWaypointCustom4Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom4Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom5Action)) then {
    GVAR(onWaypointCustom5Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom5Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom6Action)) then {
    GVAR(onWaypointCustom6Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom6Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom7Action)) then {
    GVAR(onWaypointCustom7Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom7Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom8Action)) then {
    GVAR(onWaypointCustom8Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom8Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom9Action)) then {
    GVAR(onWaypointCustom9Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom9Action",""] call BIS_fnc_returnConfigEntry);
};

if (isNil QGVAR(onWaypointCustom10Action)) then {
    GVAR(onWaypointCustom10Action) = compile ([missionConfigFile >> "CfgGradAICommand","onWaypointCustom10Action",""] call BIS_fnc_returnConfigEntry);
};



if (hasInterface) then {
    _action = ["grad_aicommand_actionNode", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {[group (_this select 0)] call FUNC(isEditableGroup)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_highcommandAction", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {(_this select 1) getVariable [QGVAR(canUseHighcommand),GVAR(canUseHighcommandDefault)]}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
