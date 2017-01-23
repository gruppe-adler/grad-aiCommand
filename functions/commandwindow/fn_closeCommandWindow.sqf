#include "..\..\dialog\contextmenu\defines.hpp"

systemChat "closeCommandWindow";

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];

[] call grad_aicommand_fnc_removeAllEHs;
[] call grad_aicommand_fnc_deleteCurrentUnitMarkers;
[] call grad_aicommand_fnc_deleteAllWaypointMarkers;
/*[_currentUnit,_currentWaypoints] call grad_aicommand_fnc_executeWaypoints;*/

closeDialog grad_aicommand_contextmenu_DIALOG;
