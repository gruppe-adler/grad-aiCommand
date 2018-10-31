#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"


params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _nearestWaypoint = [_mousePosWorld, group _currentUnit] call FUNC(findNearestWP);

// null waypoint is empty array
if (count _nearestWaypoint > 0) then {

    _wpWorldPos = waypointPosition _nearestWaypoint;
    _wpScreenPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;
    _clickDistance = _wpScreenPos distance [_x,_y];

    if (_clickDistance < 0.02) then {
        _currentUnit setVariable [QGVAR(selectedWaypoint),_nearestWaypoint];
        _dialogPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;
        [true,_dialogPos,_nearestWaypoint] call FUNC(openContextMenu);
    };
};
