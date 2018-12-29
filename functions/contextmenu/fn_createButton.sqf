#include "..\..\dialog\ui_toolkit.hpp"

params ["_display","_idc","_controlsGroup","_pos","_statement",["_text",""]];

private _button = controlNull;
if (isNull (_controlsGroup controlsGroupCtrl _idc)) then {
    _button = _display ctrlCreate ["RscButtonMenu",_idc,_controlsGroup];
} else {
    _button = _controlsGroup controlsGroupCtrl _idc;
    _button ctrlRemoveAllEventHandlers "buttonClick";
};

_button ctrlShow true;
_button ctrlSetText _text;
_button ctrlSetPosition _pos;
_button ctrlAddEventHandler ["buttonClick",_statement];
_button ctrlCommit 0;

_button
