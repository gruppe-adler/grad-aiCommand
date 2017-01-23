systemChat "creating waypoint menu";

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_display","_dialogPos","_waypoint"];

_idc = grad_aicommand_contextmenu_WPCG + 1;
_buttonW = grad_aicommand_contextmenu_ButtonW;
_buttonH = grad_aicommand_contextmenu_ButtonH;
_xButton = 0;
_yButton = 0;
_pos = _dialogPos;
_pos params ["_xCG","_yCG"];
_waypoint params ["_wpPos","_wpSpeed","_wpTimeout","_wpType","_wpStatements"];

ctrlDelete (_display displayCtrl grad_aicommand_contextmenu_WPCG);

_parentGroup ctrlEnable false;
_controlsGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",grad_aicommand_contextmenu_WPCG];
_controlsGroup ctrlAddEventHandler ["MouseButtonDown",{_this call grad_aicommand_contextmenu_catchMouseClick}];
_controlsGroup ctrlSetPosition [_xCG,_yCG,2,2];
_controlsGroup ctrlCommit 0;

_create = {
    [_display,_idc,_controlsGroup,_text,[_xButton,_yButton,_buttonW,_buttonH],_statement] call grad_aicommand_fnc_createButton;
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH*1.05;
};


_text = format ["TYPE (%1)",_wpType];
_statement = "[_this select 0, 'TYPE',[
    ['MOVE',""['MOVE'] call grad_aicommand_fnc_setWPType;""],
    ['CYCLE',""['CYCLE'] call grad_aicommand_fnc_setWPType;""],
    ['GETIN NEAREST',""['GETIN NEAREST'] call grad_aicommand_fnc_setWPType;""],
    ['GETOUT',""['GETOUT'] call grad_aicommand_fnc_setWPType;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["SPEED (%1)",_wpSpeed];
_statement = "[_this select 0, 'SPEED',[
    ['UNCHANGED',""['UNCHANGED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['LIMITED',""['LIMITED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['NORMAL',""['NORMAL'] call grad_aicommand_fnc_setWPSpeed;""],
    ['FULL',""['FULL'] call grad_aicommand_fnc_setWPSpeed;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["WAIT (%1 SECONDS)",_wpTimeout select 0];
_statement = "[_this select 0, 'WAIT',[
    ['30 Seconds',""[30] call grad_aicommand_fnc_setWPTimeout;""],
    ['60 Seconds',""[60] call grad_aicommand_fnc_setWPTimeout;""],
    ['90 Seconds',""[90] call grad_aicommand_fnc_setWPTimeout;""],
    ['120 Seconds',""[120] call grad_aicommand_fnc_setWPTimeout;""],
    ['180 Seconds',""[180] call grad_aicommand_fnc_setWPTimeout;""],
    ['240 Seconds',""[240] call grad_aicommand_fnc_setWPTimeout;""],
    ['300 Seconds',""[300] call grad_aicommand_fnc_setWPTimeout;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = "DELETE WAYPOINT";
_statement = "
    grad_aicommand_isDeleteClick = true;
    [{grad_aicommand_isDeleteClick = false}, [], 1] call CBA_fnc_waitAndExecute;
    [] call grad_aicommand_fnc_deleteWP;
    [] call grad_aicommand_fnc_updateMap;
    [false] call grad_aicommand_fnc_openContextMenu;
";
call _create;
