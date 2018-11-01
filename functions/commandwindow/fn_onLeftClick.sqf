#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];


if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _nearestGroup = [_mousePosWorld] call FUNC(findNearestEditableGroup);
private _grpWorldPos = getPos leader _nearestGroup;
private _grpScreenPos = _mapCtrl ctrlMapWorldToScreen _grpWorldPos;
private _clickDistance = _grpScreenPos distance [_x,_y];


// group select mode
if (_clickDistance < 0.04 && {!isNull _nearestGroup}) then {

    if (isNull _nearestGroup) exitWith {};
    missionNamespace setVariable [QGVAR(currentUnit),leader _nearestGroup];


// waypoint mode
} else {

    _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
    _currentGroup = group _currentUnit;
    _wp = _currentGroup addWaypoint [_mousePosWorld,0];
    _wp setWaypointType "MOVE";
    [(units _currentGroup)] remoteExecCall ["ace_ai_fnc_unGarrison",0,false];
};
