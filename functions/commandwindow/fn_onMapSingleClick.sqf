params ["_clickPos","_units","_shift","_alt"];

systemChat "onMapSingleClick";

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];

_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_currentWaypoints pushBack [_clickPos,"NORMAL",[0,0,0],"MOVE",["true",""]];
[_currentWaypoints,_currentUnit] call grad_aicommand_fnc_updateMap;


//override default click action
true
