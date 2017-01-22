params ["_currentWaypoints","_currentUnit"];
private ["_lastWP"];

[] call grad_aicommand_fnc_deleteAllWaypointMarkers;

_currentArrows = missionNamespace getVariable ["grad_aicommand_currentArrowMarkers",[]];
for [{_i=0}, {_i<count _currentWaypoints}, {_i=_i+1}] do {
    _thisWP = _currentWaypoints select _i;

    _lastWPPos = if (isNil "_lastWP") then {getPos _currentUnit} else {_lastWP select 0};
    _thisWPPos = _thisWP select 0;

    _dir = _lastWPPos getDir _thisWPPos;
    _distance = _lastWPPos distance2D _thisWPPos;
    _center = _lastWPPos getPos [_distance/2,_dir];

    _arrowName = format ["grad_aiCommand_arrowMarker_%1",_i];
    _arrow = [_arrowName,_center,_dir,"COLORBLACK",_distance] call grad_aicommand_fnc_createArrowMarker;
    _currentArrows pushBack _arrow;

    _lastWP = _thisWP;
};
