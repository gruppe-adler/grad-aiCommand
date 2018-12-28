#include "script_component.hpp"

params ["_type"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    [_currentWaypoint,_type] remoteExecCall ["setWaypointType",2,false];
};
