#include "script_component.hpp"

params ["_speed"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_speed in ["UNCHANGED","LIMITED","NORMAL","FULL"]) then {
    [_currentWaypoint,_speed] remoteExecCall ["setWaypointSpeed",2,false];
};
