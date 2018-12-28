#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
private _nearestWaypoint = [];

// null waypoint is empty array
if (
    !isNull _currentGroup &&
    {
        _nearestWaypoint = [_mousePosWorld, _currentGroup] call FUNC(findNearestWP);
        count _nearestWaypoint > 0
    } &&
    {
        (_mapCtrl ctrlMapWorldToScreen (waypointPosition _nearestWaypoint)) distance GVAR(leftButtonDownPosScreen) < 0.03
    }
) then {

    // user is dragging waypoint
    [{
        params ["_args","_handle"];
        _args params ["_currentGroup","_nearestWaypoint","_mapCtrl"];

        if (!GVAR(leftButtonDown) || isNull _mapCtrl || isNull _currentGroup) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        _mousePosWorld = _mapCtrl ctrlMapScreenToWorld getMousePosition;
        _nearestWaypoint setWaypointPosition [_mousePosWorld,0];

    },0,[_currentGroup,_nearestWaypoint,_mapCtrl]] call CBA_fnc_addPerFrameHandler;

} else {

    // user is dragging selection box
    GVAR(selectDrawEH) = _mapCtrl ctrlAddEventHandler ["draw",{
        params ["_mapCtrl"];

        (_mapCtrl ctrlMapScreenToWorld getMousePosition) params ["_currentMouseX","_currentMouseY"];
        GVAR(leftButtonDownPosWorld) params ["_startMouseX","_startMouseY"];

        if (!GVAR(leftButtonDown) || isNull _mapCtrl) exitWith {
            private _endPosScreen = _mapCtrl ctrlMapWorldToScreen [_currentMouseX,_currentMouseY];

            if (
                (diag_tickTime - GVAR(leftButtonDownTime)) > 0.5 ||
                {GVAR(leftButtonDownPosScreen) distance _endPosScreen > 0.02}
            ) then {
                [_mapCtrl,GVAR(leftButtonDownPosWorld),[_currentMouseX,_currentMouseY]] call FUNC(onBoxSelected);
            };
            _mapCtrl ctrlRemoveEventHandler ["draw",GVAR(selectDrawEH)];
        };

        _halfDeltaX = (_currentMouseX - _startMouseX)/2;
        _halfDeltaY = (_currentMouseY - _startMouseY)/2;

        _mapCtrl drawRectangle [[_startMouseX + _halfDeltaX,_startMouseY + _halfDeltaY],_halfDeltaX,_halfDeltaY,0,[0,0,0,1],""];
    }];
};
