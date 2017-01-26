systemChat "onRightClick";

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

_mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];
_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_nearestWaypointID = [_mousePosWorld, _waypoints] call grad_aicommand_fnc_findNearestWP;

// >0 because original position is a wp, but should not have a context menu
if (_nearestWaypointID > 0) then {
    missionNamespace setVariable ["grad_aicommand_selectedWaypoint",_nearestWaypointID];

    _wpPos = (_waypoints select _nearestWaypointID) select 0;
    _dialogPos = _mapCtrl ctrlMapWorldToScreen _wpPos;

    [true,_dialogPos,_waypoints select _nearestWaypointID] call grad_aicommand_fnc_openContextMenu;
};
