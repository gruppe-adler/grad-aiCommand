systemChat "creating sub menu";

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_parent","_mode","_menuItems"];
(ctrlPosition _parent) params ["_parentX","_parentY","_parentW","_parentH"];

_groupIDC = switch (_mode) do {
    case ("TYPE"): {grad_aicommand_contextmenu_TypeCG};
    case ("SPEED"): {grad_aicommand_contextmenu_SpeedCG};
    case ("WAIT"): {grad_aicommand_contextmenu_WaitCG};
};

_display = findDisplay grad_aicommand_contextmenu_DIALOG;
_parentGroup = _display displayCtrl grad_aicommand_contextmenu_WPCG;
(ctrlPosition _parentGroup) params ["_parentGroupX","_parentGroupY"];

ctrlDelete (_display displayCtrl grad_aicommand_contextmenu_TypeCG);
ctrlDelete (_display displayCtrl grad_aicommand_contextmenu_SpeedCG);
ctrlDelete (_display displayCtrl grad_aicommand_contextmenu_WaitCG);

_idc = grad_aicommand_contextmenu_TypeCG + 1;
_buttonW = grad_aicommand_contextmenu_ButtonW;
_buttonH = grad_aicommand_contextmenu_ButtonH;
_xButton = 0;
_yButton = 0;
_xCG = _parentX + _parentW * 1.01;
_yCG = _parentY;

/*_parentGroup ctrlEnable false;*/
_controlsGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",_groupIDC,_parentGroup];
_controlsGroup ctrlAddEventHandler ["MouseButtonDown",{_this call grad_aicommand_contextmenu_catchMouseClick}];
_controlsGroup ctrlSetPosition [_xCG,_yCG,2,2];
_controlsGroup ctrlCommit 0;

_create = {
    [_display,_idc,_controlsGroup,_text,[_xButton,_yButton,_buttonW,_buttonH],_statement] call grad_aicommand_fnc_createButton;
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH*1.05;
};

{
    _x params ["_text","_statement"];
    _statement = _statement + " [] call grad_aicommand_fnc_updateContextMenu";
    call _create;
} forEach _menuItems;
