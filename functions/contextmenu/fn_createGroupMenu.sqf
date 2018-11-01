#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"
#include "script_component.hpp"

params ["_dialogPos","_group"];

if (isNull _group) exitWith {};

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
private _update = {_this ctrlSetText format ["SHOW UNITS (%1)",["OFF","ON"] select ((missionNamespace getVariable [QGVAR(currentGroup),grpNull]) in GVAR(individualUnitsGroups))]};
private _statement = QUOTE([] call FUNC(setGroupIndividualUnits); [false] call FUNC(openContextMenu));
call _fnc_create;
