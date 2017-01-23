params ["_pos","_waypoints"];

_nearestWaypointID = -1;
_distance = 100;
{
    _wpPos = _x select 0;
    _distanceWP = _pos distance2D _wpPos;
    if (_distanceWP < _distance) then {
        _nearestWaypointID = _forEachIndex;
        _distance = _distanceWP;
    };
} forEach _waypoints;

_nearestWaypointID
