#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

#include "script_component.hpp"

params ["_unit","_player"];
private "_editMode";

createDialog QGVAR(commandwindow);
private _display = findDisplay grad_aicommand_commandwindow_DIALOG;
private _map = _display ctrlCreate ["RscMapControl",grad_aicommand_commandwindow_MAP];
private _contextmenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",grad_aicommand_contextmenu_GROUP];
_map ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_map ctrlCommit 0;
_contextmenu ctrlShow false;

GVAR(highcommandSide) = side _player;

// highcommand mode
if (_unit == _player) then {
    _editMode = 0;
    GVAR(currentGroup) = grpNull;
    GVAR(editableGroups) = [];
    [] call FUNC(updateEditableGroups);

// normal edit mode
} else {
    _editMode = 1;
    GVAR(currentGroup) = group _unit;
    GVAR(editableGroups) = [group _unit];
};

_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawEditableGroups)}];
_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawArrows)}];
[_display,_map] call FUNC(addEHs);
