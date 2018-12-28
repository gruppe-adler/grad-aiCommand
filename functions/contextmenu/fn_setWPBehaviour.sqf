#include "script_component.hpp"

params [["_behaviour",""]];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_behaviour in ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"]) then {
    [_currentWaypoint,_behaviour] remoteExecCall ["setWaypointBehaviour",2,false];
};
