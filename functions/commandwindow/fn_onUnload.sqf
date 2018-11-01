#include "script_component.hpp"

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
_currentUnit setVariable [QGVAR(selectedWaypoint),nil];

missionNamespace setVariable [QGVAR(currentUnit),nil];

[] call FUNC(removeAllEHs);
