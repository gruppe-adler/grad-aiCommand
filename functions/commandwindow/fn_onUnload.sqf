#include "script_component.hpp"

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
_currentUnit setVariable [QGVAR(selectedWaypoint),nil];
missionNamespace setVariable [QGVAR(currentUnit),nil];

[{(group _this) setVariable ["grad_aicommand_isBeingEdited",false,true];}, _currentUnit, 3] call CBA_fnc_waitAndExecute;

[] call FUNC(removeAllEHs);
