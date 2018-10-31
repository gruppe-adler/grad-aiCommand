#include "script_component.hpp"

params ["_timeout"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

[_currentWaypoint,[_timeout,_timeout,_timeout]] remoteExecCall ["setWaypointTimeout",2,false];
