params ["_unit","_waypoints"];

_group = group _unit;

{
    _x params ["_pos","_speed","_timeout","_type","_statements"];

    if (_type == "CYCLE") then {
        _wp = _group addWaypoint [_pos,0];
        _wp setWaypointSpeed _speed;
        _wp setWaypointType "MOVE";
    };

    _wp = _group addWaypoint [_pos,0];
    _wp setWaypointSpeed _speed;
    _wp setWaypointTimeout _timeout;
    _wp setWaypointType _type;
    _wp setWaypointStatements _statements;
} forEach _waypoints;
