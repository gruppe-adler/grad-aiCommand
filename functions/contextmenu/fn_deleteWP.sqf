_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};

_waypoints deleteAt _wpIndex;
