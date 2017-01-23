params ["_clickPos","_shift","_alt"];

if (missionNamespace getVariable ['grad_aicommand_contextmenu_isOpen',false]) exitWith {};
if (missionNamespace getVariable ["grad_aicommand_isDeleteClick",false]) exitWith {};

systemChat "onMapSingleClick";

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_currentWaypoints pushBack [_clickPos,"UNCHANGED",[0,0,0],"MOVE",["true",""]];
[] call grad_aicommand_fnc_updateMap;


//override default click action
true
