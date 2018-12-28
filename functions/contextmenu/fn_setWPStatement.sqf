#include "script_component.hpp"

params ["_condition","_statement","_statementName"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

_currentWaypoint setWaypointStatements [_condition,_statement];
_currentWaypoint setWaypointDescription _statementName;
