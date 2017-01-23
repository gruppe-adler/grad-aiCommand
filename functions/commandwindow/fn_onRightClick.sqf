
_mousePosScreen = getMousePosition;
_mousePosWorld = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld _mousePosScreen;
_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];

_nearestWaypointID = [_mousePosWorld, _waypoints] call grad_aicommand_fnc_findNearestWP;

systemChat "onRightClick";
systemChat str _mousePosScreen;
systemChat str _mousePosWorld;
systemChat str _nearestWaypointID;

if (_nearestWaypointID >= 0) then {
    missionNamespace setVariable ["grad_aicommand_selectedWaypoint",_nearestWaypointID];
    
    _wpPos = (_waypoints select _nearestWaypointID) select 0;
    _dialogPos = (findDisplay 12 displayCtrl 51) ctrlMapWorldToScreen _wpPos;
    [true,_mousePosScreen,_waypoints select _nearestWaypointID] call grad_aicommand_fnc_openContextMenu;
};
