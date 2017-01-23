params ["_type"];

_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};

_wp = _waypoints select _wpIndex;

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    _wp set [3,_type];
};
