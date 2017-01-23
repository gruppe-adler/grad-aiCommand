#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"


params ["_open",["_dialogPos",[0,0]],["_waypoint",[]]];

if (_open) then {
    _display = findDisplay grad_aicommand_contextmenu_DIALOG;
    if (isNull _display) then {

        (findDisplay 46) createDisplay "grad_aicommand_contextmenu";
        missionNamespace setVariable ["grad_aicommand_contextmenu_isOpen",true];

        _display = findDisplay grad_aicommand_contextmenu_DIALOG;
        [_display,_dialogPos,_waypoint] call grad_aicommand_fnc_createWaypointMenu;

    };



} else {
    _display = findDisplay grad_aicommand_contextmenu_DIALOG;
    if (!isNull _display) then {

        closeDialog grad_aicommand_contextmenu_DIALOG;
        missionNamespace setVariable ["grad_aicommand_contextmenu_isOpen",false];

    };
};
