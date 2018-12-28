#include "script_component.hpp"

params ["_timeout"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

[_currentWaypoint,[_timeout,_timeout,_timeout]] remoteExecCall ["setWaypointTimeout",2,false];
