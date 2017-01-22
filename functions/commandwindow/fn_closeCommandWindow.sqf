systemChat "closeCommandWindow";

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];


[] call grad_aicommand_fnc_removeAllEHs;
[] call grad_aicommand_fnc_deleteCurrentUnitMarkers;
[] call grad_aicommand_fnc_deleteAllWaypointMarkers;
[_currentUnit,_currentWaypoints] call grad_aicommand_fnc_executeWaypoints;
