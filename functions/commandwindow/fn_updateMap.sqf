private ["_lastWP"];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];

[] call grad_aicommand_fnc_deleteAllWaypointMarkers;

_currentArrows = missionNamespace getVariable ["grad_aicommand_currentArrowMarkers",[]];
for [{_i=1}, {_i<count _currentWaypoints}, {_i=_i+1}] do {
    _lastWP = _currentWaypoints select (_i-1);
    _thisWP = _currentWaypoints select _i;
    _lastWPPos = _lastWP select 0;
    _thisWPPos = _thisWP select 0;

    _dir = _lastWPPos getDir _thisWPPos;
    _distance = _lastWPPos distance2D _thisWPPos;
    _center = _lastWPPos getPos [_distance/2,_dir];

    _arrowName = format ["grad_aicommand_arrowMarker_%1",_i];
    _arrow = [_arrowName,_center,_dir,"COLORBLACK",_distance] call grad_aicommand_fnc_createArrowMarker;
    _currentArrows pushBack _arrow;

    _thisType = _thisWP select 3;
    if (_thisType == "CYCLE") then {
        _nearestWPID = [_thisWPPos,_currentWaypoints,99999,[_i,_i-1]] call grad_aicommand_fnc_findNearestWP;
        if (_nearestWPID >= 0) then {
            _nearestWP = _currentWaypoints select _nearestWPID;
            _nearestWPPos = _nearestWP select 0;
            _dir = _thisWPPos getDir _nearestWPPos;
            _distance = _thisWPPos distance2D _nearestWPPos;
            _center = _thisWPPos getPos [_distance/2,_dir];

            _arrowName = format ["grad_aicommand_arrowMarker_cycle_%1",_i];
            _arrow = [_arrowName,_center,_dir,"COLORBLACK",_distance] call grad_aicommand_fnc_createArrowMarker;
            _currentArrows pushBack _arrow;
        };
    };
};
