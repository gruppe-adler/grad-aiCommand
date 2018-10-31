#include "script_component.hpp"

params ["_condition","_statement","_statementName"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

_currentWaypoint params ["_group","_waypointID"];
private _wpStatementNames = _group getVariable [QGVAR(waypointStatementNames),[]];

_wpStatementNames set [_waypointID,_statementName];
_group setVariable [QGVAR(waypointStatementNames),_wpStatementNames,true];

_currentWaypoint setWaypointStatements [_condition,_statement];
