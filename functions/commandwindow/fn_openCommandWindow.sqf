#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

#include "script_component.hpp"

params ["_unit","_player"];

createDialog QGVAR(commandwindow);
private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _map = _display ctrlCreate ["RscMapControl",GRAD_AICOMMAND_COMMANDWINDOW_MAP];
private _contextmenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",GRAD_AICOMMAND_CONTEXTMENU_GROUP];
private _renameGroupMenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",GRAD_AICOMMAND_RENAMEGROUP_GROUP];
_map ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_map ctrlCommit 0;
_contextmenu ctrlShow false;
_renameGroupMenu ctrlShow false;

GVAR(highcommandSide) = side _player;

if (isNil QGVAR(individualUnitsGroups)) then {GVAR(individualUnitsGroups) = []};

// highcommand mode
if (_unit == _player) then {
    GVAR(editMode) = 0;
    GVAR(currentGroup) = grpNull;
    GVAR(editableGroups) = [];
    [] call FUNC(updateEditableGroups);

// direct edit mode
} else {
    GVAR(editMode) = 1;
    GVAR(currentGroup) = group _unit;
    GVAR(editableGroups) = [group _unit];
};

_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawEditableGroups)}];
_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawIndividualUnits)}];
_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawArrows)}];
[_display,_map] call FUNC(addEHs);
