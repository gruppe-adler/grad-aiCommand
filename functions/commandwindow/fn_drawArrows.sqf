#include "script_component.hpp"

params ["_map"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _waypoints = waypoints _currentUnit;
private _color = [side _currentUnit] call FUNC(getSideColor);

private _currentWaypointID = currentWaypoint group _currentUnit;

for [{_i = _currentWaypointID}, {_i<count _waypoints}, {_i=_i+1}] do {
    _lastWP = _waypoints param [_i-1,[]];
    _thisWP = _waypoints select _i;

    _lastWPPos = if (_i == _currentWaypointID || count _lastWP == 0) then {getPos _currentUnit} else {waypointPosition _lastWP};
    _thisWPPos = waypointPosition _thisWP;

    _map drawArrow [_lastWPPos,_thisWPPos,_color];
};
