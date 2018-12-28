#include "script_component.hpp"

params [["_combatMode",""]];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_combatMode in ["NO CHANGE","GREEN","WHITE","YELLOW", "RED"]) then {
    [_currentWaypoint,_combatMode] remoteExecCall ["setWaypointCombatMode",2,false];
};
