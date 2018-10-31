#include "script_component.hpp"

params ["_pos"];

private _editableGroups = allGroups select {
    side _x == (missionNamespace getVariable [QGVAR(highcommandSide),sideUnknown]) &&
    {count units _x > 0} &&
    {{isPlayer _x} count units _x == 0}
};

private _nearestGroup = grpNull;
private _minDist = 99999999999999;
{
    _distance = _pos distance2D (getPos leader _x);
    if (_distance < _minDist) then {
        _minDist = _distance;
        _nearestGroup = _x;
    };
} forEach _editableGroups;

_nearestGroup
