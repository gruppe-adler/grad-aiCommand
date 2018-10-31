#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"
#include "script_component.hpp"

params ["_dialogPos","_waypoint"];

if (count _waypoint == 0) exitWith {};

private _display = findDisplay grad_aicommand_commandwindow_DIALOG;
private _map = _display displayCtrl grad_aicommand_commandwindow_MAP;
private _controlsGroup = _display displayCtrl grad_aicommand_contextmenu_GROUP;

private _idc = grad_aicommand_contextmenu_GROUP + 1;
private _buttonW = grad_aicommand_contextmenu_ButtonW;
private _buttonH = grad_aicommand_contextmenu_ButtonH;
private _xButton = 0;
private _yButton = 0;

_dialogPos params ["_xCG","_yCG"];

_controlsGroup ctrlSetPosition [_xCG,_yCG,safezoneW,safeZoneH];
_controlsGroup ctrlCommit 0;
_map ctrlShow false;
_map ctrlShow true;

private _fnc_create = {
    _button = [_display,_idc,_controlsGroup,[_xButton,_yButton,_buttonW,_buttonH],_statement,_text] call grad_aicommand_fnc_createButton;
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH * 1.05;

    if (!isNil "_update") then {
        [_button,_update] call _fnc_update;
    };
};

private _fnc_update = {
    [{
        params ["_args","_handle"];
        _args params ["_button","_update"];

        if (isNull _button) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
        _button call _update;
    },0,_this] call CBA_fnc_addPerFrameHandler;
};

private _text = "";
private _update = {_this ctrlSetText format ["TYPE (%1)",waypointType ((missionNamespace getVariable [QGVAR(currentUnit),objNull]) getVariable [QGVAR(selectedWaypoint),[grpNull,-1]])]};
private _statement = "[_this select 0, 'TYPE',[
    ['MOVE',""['MOVE'] call grad_aicommand_fnc_setWPType;""],
    ['CYCLE',""['CYCLE'] call grad_aicommand_fnc_setWPType;""],
    ['GETIN NEAREST',""['GETIN NEAREST'] call grad_aicommand_fnc_setWPType;""],
    ['GETOUT',""['GETOUT'] call grad_aicommand_fnc_setWPType;""]
]] call grad_aicommand_fnc_createSubMenu";
call _fnc_create;

_update = {_this ctrlSetText format ["SPEED (%1)",waypointSpeed ((missionNamespace getVariable [QGVAR(currentUnit),objNull]) getVariable [QGVAR(selectedWaypoint),[grpNull,-1]])]};
_statement = "[_this select 0, 'SPEED',[
    ['UNCHANGED',""['UNCHANGED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['LIMITED',""['LIMITED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['NORMAL',""['NORMAL'] call grad_aicommand_fnc_setWPSpeed;""],
    ['FULL',""['FULL'] call grad_aicommand_fnc_setWPSpeed;""]
]] call grad_aicommand_fnc_createSubMenu";
call _fnc_create;

_update = {_this ctrlSetText format ["WAIT (%1 SECONDS)",(waypointTimeout ((missionNamespace getVariable [QGVAR(currentUnit),objNull]) getVariable [QGVAR(selectedWaypoint),[grpNull,-1]])) select 0]};
_statement = "[_this select 0, 'WAIT',[
    ['0s',""[0] call grad_aicommand_fnc_setWPTimeout;""],
    ['30s',""[30] call grad_aicommand_fnc_setWPTimeout;""],
    ['60s',""[60] call grad_aicommand_fnc_setWPTimeout;""],
    ['90s',""[90] call grad_aicommand_fnc_setWPTimeout;""],
    ['2 minutes',""[120] call grad_aicommand_fnc_setWPTimeout;""],
    ['3 minutes',""[180] call grad_aicommand_fnc_setWPTimeout;""],
    ['4 minutes',""[240] call grad_aicommand_fnc_setWPTimeout;""],
    ['5 minutes',""[300] call grad_aicommand_fnc_setWPTimeout;""],
    ['10 minutes',""[600] call grad_aicommand_fnc_setWPTimeout;""],
    ['15 minutes',""[900] call grad_aicommand_fnc_setWPTimeout;""]
]] call grad_aicommand_fnc_createSubMenu";
call _fnc_create;

_update = {
    _waypointDescription = waypointDescription ((missionNamespace getVariable [QGVAR(currentUnit),objNull]) getVariable [QGVAR(selectedWaypoint),[grpNull,-1]]);
    if (_waypointDescription == "") then {_waypointDescription = "NONE"};
    _this ctrlSetText format ["ACTION (%1)",_waypointDescription];
};
_statement = "[_this select 0, 'STATEMENT',[
    ['NONE',""['true','','NONE'] call grad_aicommand_fnc_setWPStatement;""],
    ['SEARCH NEARBY',""['true','[group this] call CBA_fnc_searchNearby','SEARCH NEARBY'] call grad_aicommand_fnc_setWPStatement;""],
    ['DEFEND',""['true','[group this] call CBA_fnc_taskDefend','DEFEND'] call grad_aicommand_fnc_setWPStatement;""],
    ['GARRISON',""['true','[getpos this,nil,thisList,30] call ace_ai_fnc_garrison','GARRISON'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (50m)',""['true','[group this,getPos this,50] call CBA_fnc_taskPatrol','PATROL (50m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (100m)',""['true','[group this,getPos this,100] call CBA_fnc_taskPatrol','PATROL (100m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (200m)',""['true','[group this,getPos this,200] call CBA_fnc_taskPatrol','PATROL (200m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (400m)',""['true','[group this,getPos this,400] call CBA_fnc_taskPatrol','PATROL (400m)'] call grad_aicommand_fnc_setWPStatement;""]
]] call grad_aicommand_fnc_createSubMenu";
call _fnc_create;

_update = nil;
_text = "DELETE WAYPOINT";
_statement = "
    grad_aicommand_isDeleteClick = true;
    [{grad_aicommand_isDeleteClick = false}, [], 1] call CBA_fnc_waitAndExecute;
    [] call grad_aicommand_fnc_deleteWP;
    [false] call grad_aicommand_fnc_openContextMenu;
";
call _fnc_create;

_text = "DELETE ALL WAYPOINTS";
_statement = "
    grad_aicommand_isDeleteClick = true;
    [{grad_aicommand_isDeleteClick = false}, [], 1] call CBA_fnc_waitAndExecute;
    ['ALL'] call grad_aicommand_fnc_deleteWP;
    [false] call grad_aicommand_fnc_openContextMenu;
";
call _fnc_create;
