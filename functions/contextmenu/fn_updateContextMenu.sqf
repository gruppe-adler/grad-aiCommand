systemChat "updating context menu";

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

_display = findDisplay grad_aicommand_contextmenu_DIALOG;
ctrlPosition (_display displayCtrl grad_aicommand_contextmenu_WPCG) params ["_x","_y"];

_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};
_wp = _waypoints select _wpIndex;

[false] call grad_aicommand_fnc_openContextMenu;
[{isNull (findDisplay grad_aicommand_contextmenu_DIALOG)}, {_this call grad_aicommand_fnc_openContextMenu}, [true,[_x,_y],_wp]] call CBA_fnc_waitUntilAndExecute;
