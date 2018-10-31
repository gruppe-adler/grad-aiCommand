#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

#include "script_component.hpp"

params ["_unit","_player"];

createDialog QGVAR(commandwindow);
_display = findDisplay grad_aicommand_commandwindow_DIALOG;
_map = _display ctrlCreate ["RscMapControl",grad_aicommand_commandwindow_MAP];
_map ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_map ctrlCommit 0;
_contextmenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",grad_aicommand_contextmenu_GROUP];
_contextmenu ctrlShow false;



// highcommand mode
if (_unit == _player) then {
    GVAR(currentUnit) = objNull;
    GVAR(highcommandSide) = side _unit;
    _map ctrlAddEventHandler ["Draw",{_this call FUNC(drawEditableGroups)}];



// normal edit mode
} else {

    GVAR(currentUnit) = _unit;
    (group _unit) setVariable [QGVAR(isBeingEdited),true,true];

    _map ctrlAddEventHandler ["Draw",{_this call FUNC(drawCurrentUnits)}];
};


_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawArrows)}];
[_display,_map] call FUNC(addEHs);
