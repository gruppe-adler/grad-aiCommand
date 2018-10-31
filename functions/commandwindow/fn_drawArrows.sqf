#include "script_component.hpp"

params ["_map"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoints = (group _currentUnit) getVariable [QGVAR(currentWaypoints),[]];
private _color = [side _currentUnit] call FUNC(getSideColor);

for [{_i=1}, {_i<count _currentWaypoints}, {_i=_i+1}] do {
    _lastWP = _currentWaypoints select (_i-1);
    _thisWP = _currentWaypoints select _i;
    _lastWPPos = _lastWP select 0;
    _thisWPPos = _thisWP select 0;

    _map drawArrow [_lastWPPos,_thisWPPos,_color];

    _thisType = _thisWP select 3;
    if (_thisType == "CYCLE") then {
        _nearestWPID = [_thisWPPos,_currentWaypoints,99999,[_i,_i-1]] call grad_aicommand_fnc_findNearestWP;
        if (_nearestWPID >= 0) then {
            _nearestWP = _currentWaypoints select _nearestWPID;
            _nearestWPPos = _nearestWP select 0;
            _map drawArrow [_thisWPPos,_nearestWPPos,_color];
        };
    };
};
