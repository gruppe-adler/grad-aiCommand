systemChat "addEHs";

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

params ["_mapCtrl"];

onMapSingleClick {[_pos,_shift,_alt] call grad_aicommand_fnc_onMapSingleClick};

grad_aicommand_mouseButtonEH = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];
    if (_button == 1) then {
        _this call grad_aicommand_fnc_onRightClick;
    };
    false
}];
