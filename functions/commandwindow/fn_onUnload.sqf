_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];

[] call grad_aicommand_fnc_removeAllEHs;

/*if (count _currentWaypoints > 1) then {
    [_currentUnit,_currentWaypoints] call grad_aicommand_fnc_executeWaypoints;
};*/
