#include "script_component.hpp"

params ["_type"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    [_currentWaypoint,_type] remoteExecCall ["setWaypointType",2,false];
};
