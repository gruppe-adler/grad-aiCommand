#include "script_component.hpp"

params ["_condition","_statement","_statementName"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

_currentWaypoint setWaypointStatements [_condition,_statement];
_currentWaypoint setWaypointDescription _statementName;
