params ["_speed"];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];

if (_wpIndex < 0) exitWith {};

_wp = _currentWaypoints select _wpIndex;

if (_speed in ["UNCHANGED","LIMITED","NORMAL","FULL"]) then {
    _wp set [1,_speed];
};
