#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"

params [["_buttonCtrl",controlNull]];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _display = ctrlParent _buttonCtrl;
if (isNull _display) exitWith {};

private _map = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;

private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_RENAMEGROUP_GROUP;
_controlsGroup ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_controlsGroup ctrlCommit 0;

private _titlebar = _display ctrlCreate ["RscTitle",GRAD_AICOMMAND_RENAMEGROUP_TITLE,_controlsGroup];
_titlebar ctrlSetText format ["RENAME %1",toUpper groupID _currentGroup];
_titlebar ctrlSetBackgroundColor [0,0,0,0.8];
_titlebar ctrlSetPosition [GRAD_AICOMMAND_RENAMEGROUP_X,GRAD_AICOMMAND_RENAMEGROUP_Y,GRAD_AICOMMAND_RENAMEGROUP_W,GRAD_AICOMMAND_RENAMEGROUP_TITLEBAR_H];
_titlebar ctrlCommit 0;

private _background = _display ctrlCreate ["RscBackground",-1,_controlsGroup];
_background ctrlSetPosition [GRAD_AICOMMAND_RENAMEGROUP_X,GRAD_AICOMMAND_RENAMEGROUP_BG_Y,GRAD_AICOMMAND_RENAMEGROUP_W,GRAD_AICOMMAND_RENAMEGROUP_H];
_background ctrlSetBackgroundColor [0,0,0,0.8];
_background ctrlCommit 0;

private _editBox = _display ctrlCreate ["RscEdit",-1,_controlsGroup];
_editBox ctrlSetPosition [GRAD_AICOMMAND_RENAMEGROUP_EDIT_X,GRAD_AICOMMAND_RENAMEGROUP_EDIT_Y,GRAD_AICOMMAND_RENAMEGROUP_EDIT_W,GRAD_AICOMMAND_RENAMEGROUP_EDIT_H];
_editBox ctrlCommit 0;

_controlsGroup ctrlShow true;
_map ctrlShow false;
_map ctrlShow true;


_editBox ctrlAddEventHandler ["KeyDown",{
    params [["_editBox",controlNull],["_dik",-1]];

    if !(_dik in [DIK_RETURN,DIK_NUMPADENTER]) exitWith {};
    if (isNull _editBox) exitWith {};

    _controlsGroup = ctrlParentControlsGroup _editBox;
    if (isNull _controlsGroup) exitWith {};

    /* _newGroupName = [ctrlText _editBox,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_() "] call BIS_fnc_filterString; */
    _newGroupName = ctrlText _editBox;
    if (_newGroupName == "") exitWith {};

    private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
    if (isNull _currentGroup) exitWith {_controlsGroup ctrlShow false};

    if ([_newGroupName,side _currentGroup] call FUNC(groupIdExists)) then {
        _titlebar = _controlsGroup controlsGroupCtrl GRAD_AICOMMAND_RENAMEGROUP_TITLE;
        _titlebar ctrlSetText format ["ERROR: %1 ALREADY EXISTS!",toUpper _newGroupName];
        playsound "3DEN_notificationWarning";

    } else {
        _currentGroup setGroupIdGlobal [_newGroupName];
        _editBox ctrlSetText "";
        _controlsGroup ctrlShow false;
    };
}];
