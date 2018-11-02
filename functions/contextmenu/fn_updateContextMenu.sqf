#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"
#include "script_component.hpp"


_display = findDisplay grad_aicommand_commandwindow_DIALOG;
ctrlPosition (_display displayCtrl grad_aicommand_contextmenu_GROUP) params ["_x","_y"];

/*[false] call grad_aicommand_fnc_openContextMenu;*/

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) then {
    [true,[_x,_y],_currentGroup] call FUNC(openContextMenu);
} else {
    [true,[_x,_y],_currentWaypoint] call FUNC(openContextMenu);
};


/*[{isNull ((_this select 0) displayCtrl grad_aicommand_contextmenu_GROUP)}, {(_this select 1) call grad_aicommand_fnc_openContextMenu}, [_display,[true,[_x,_y],_wp]]] call CBA_fnc_waitUntilAndExecute;*/
