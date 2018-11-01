#include "script_component.hpp"

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
_currentGroup setVariable [QGVAR(selectedWaypoint),nil];

missionNamespace setVariable [QGVAR(currentGroup),nil];

[] call FUNC(removeAllEHs);
