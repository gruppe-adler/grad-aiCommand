#include "script_component.hpp"

params ["_speed"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_speed in ["UNCHANGED","LIMITED","NORMAL","FULL"]) then {
    [_currentWaypoint,_speed] remoteExecCall ["setWaypointSpeed",2,false];
};
