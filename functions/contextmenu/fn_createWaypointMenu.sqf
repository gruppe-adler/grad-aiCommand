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

_parentGroup ctrlEnable false;
_controlsGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",grad_aicommand_contextmenu_WPCG];
_controlsGroup ctrlSetPosition [_xCG,_yCG,2,2];
_controlsGroup ctrlCommit 0;

_create = {
    [_display,_idc,_controlsGroup,_text,[_xButton,_yButton,_buttonW,_buttonH],_statement] call grad_aicommand_fnc_createButton;
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH*1.05;
};


_text = format ["TYPE (%1)",_wpType];
_statement = "[_this select 0, 'TYPE',[
    ['MOVE',""['MOVE'] call grad_aicommand_fnc_setWPType""],
    ['CYCLE',""['CYCLE'] call grad_aicommand_fnc_setWPType""],
    ['GET IN',""['GETIN NEAREST'] call grad_aicommand_fnc_setWPType""],
    ['GET OUT',""['GETOUT'] call grad_aicommand_fnc_setWPType""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["SPEED (%1)",_wpSpeed];
_statement = "[_this select 0, 'SPEED',[
    ['UNCHANGED',""['UNCHANGED'] call grad_aicommand_fnc_setWPSpeed""],
    ['LIMITED',""['LIMITED'] call grad_aicommand_fnc_setWPSpeed""],
    ['NORMAL',""['NORMAL'] call grad_aicommand_fnc_setWPSpeed""],
    ['FULL',""['FULL'] call grad_aicommand_fnc_setWPSpeed""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["WAIT (%1 SECONDS)",_wpTimeout select 0];
_statement = "_th[_this select 0, 'WAIT']is call grad_aicommand_fnc_createSubMenu";
call _create;
