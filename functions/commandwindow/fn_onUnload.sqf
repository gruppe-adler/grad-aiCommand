#include "script_component.hpp"

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
_currentGroup setVariable [QGVAR(selectedWaypoint),nil];

GVAR(currentGroup) = nil;
GVAR(submenuJoinableGroups) = nil;
GVAR(renameDialogIsOpen) = nil;

[] call FUNC(removeAllEHs);
