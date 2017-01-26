params ["_timeout"];

_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};

_wp = _waypoints select _wpIndex;

_wp set [2,[_timeout,_timeout,_timeout]];