#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_display","_idc","_controlsGroup","_text","_pos","_statement"];

_button = _display ctrlCreate ["RscButtonMenu",_idc,_controlsGroup];
_button ctrlSetText _text;
_button ctrlSetPosition _pos;
_button ctrlSetEventHandler ["ButtonClick",_statement];

_button ctrlCommit 0;

_button
