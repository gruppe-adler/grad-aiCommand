_currentArrows = missionNamespace getVariable ["grad_aicommand_currentArrowMarkers",[]];
while {count _currentArrows > 0} do {
    [_currentArrows select 0] call grad_aicommand_fnc_deleteArrowMarker;
    _currentArrows deleteAt 0;
};
