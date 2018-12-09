#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_display","_mapCtrl"];

GVAR(leftButtonDown) = false;

GVAR(keyUpEH) = _display displayAddEventHandler ["KeyUp", {
    params ["_display","_DIK"];
    //close on M
    if (_DIK in (actionKeys "HideMap") && {!(missionNamespace getVariable [QGVAR(renameDialogIsOpen),false])}) then {
        closeDialog 0;
    };
}];

GVAR(mouseDownEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control","_button"];

    // only leftclick
    if (_button > 0) exitWith {};

    GVAR(leftButtonDown) = true;

    false
}];

GVAR(mouseUpEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    // only leftclick
    if (_button > 0) exitWith {};

    GVAR(leftButtonDown) = false;

    false
}];


GVAR(mouseClickEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control","_button"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (GVAR(leftButtonDown) && {_button == 0}) then {
        _this call FUNC(onLeftHeldDown);
    } else {
        _this call ([FUNC(onLeftClick),FUNC(onRightClick)] select _button);
    };


    false
}];

GVAR(mouseDblClickEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonDblClick", {
    params ["_control","_button"];

    if (_button == 0) then {
        _this call FUNC(onLeftDblClick);
    };

    false
}];
