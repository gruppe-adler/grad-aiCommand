#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_display","_mapCtrl"];

GVAR(keyUpEH) = _display displayAddEventHandler ["KeyUp", {
    params ["_display","_DIK"];
    //close on M
    if (_DIK in (actionKeys "HideMap") && {!(missionNamespace getVariable [QGVAR(renameDialogIsOpen),false])}) then {
        closeDialog 0;
    };
}];

GVAR(mouseClickEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control","_button"];

    switch (_button) do {

        // left click
        case (0): {_this call FUNC(onLeftClick)};

        // right click
        case (1): {_this call FUNC(onRightClick)};
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
