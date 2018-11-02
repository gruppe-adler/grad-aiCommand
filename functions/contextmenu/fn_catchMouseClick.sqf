#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"
#include "script_component.hpp"

params ["_display","_button","_xPos","_yPos","_shift","_ctrl","_alt"];

if (_button == 1) exitWith {true};

private _isOverContextMenu = false;

private _controlsGroup = _display displayCtrl grad_aicommand_contextmenu_GROUP;
private _idc = grad_aicommand_contextmenu_GROUP + 1;
ctrlPosition _controlsGroup params ["_ctrlCgX","_ctrlCgY"];

while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {

    // for some weird reason, some of these variables (_ctrlX, _ctrlY, ...) were nil after the params command
	/* (ctrlPosition (_controlsGroup controlsGroupCtrl _idc)) params [["_ctrlX",0],["_ctrlY",0],["_ctrlW,",0],["_ctrlH",0]]; */

    _controlPosition = (ctrlPosition (_controlsGroup controlsGroupCtrl _idc));
    _ctrlX = _controlPosition param [0,0];
    _ctrlY = _controlPosition param [1,0];
    _ctrlW = _controlPosition param [2,0];
    _ctrlH = _controlPosition param [3,0];

	if (
		_xPos >= (_ctrlCgX + _ctrlX) &&
		{_xPos <= (_ctrlCgX + _ctrlX + _ctrlW)} &&
		{_yPos >= _ctrlCgY + _ctrlY} &&
		{_yPos <= (_ctrlCgY + _ctrlY + _ctrlH)}
	) exitWith {
		_isOverContextMenu = true;
	};

	_idc = _idc + 1;
};

if (_isOverContextMenu) exitWith {true};

_idc = grad_aicommand_contextmenu_SUBMENU + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {

    // see above
	/* (ctrlPosition (_controlsGroup controlsGroupCtrl _idc)) params [["_ctrlX",0],["_ctrlY",0],["_ctrlW,",0],["_ctrlH",0]]; */

    _controlPosition = (ctrlPosition (_controlsGroup controlsGroupCtrl _idc));
    _ctrlX = _controlPosition param [0,0];
    _ctrlY = _controlPosition param [1,0];
    _ctrlW = _controlPosition param [2,0];
    _ctrlH = _controlPosition param [3,0];

	if (
		_xPos >= (_ctrlCgX + _ctrlX) &&
		{_xPos <= (_ctrlCgX + _ctrlX + _ctrlW)} &&
		{_yPos >= _ctrlCgY + _ctrlY} &&
		{_yPos <= (_ctrlCgY + _ctrlY + _ctrlH)}
	) exitWith {
		_isOverContextMenu = true;
	};

	_idc = _idc + 1;
};

if (_isOverContextMenu) exitWith {true};

[false] call grad_aicommand_fnc_openContextMenu;

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (!isNull _currentGroup) then {
    _currentGroup setVariable [QGVAR(selectedWaypoint),nil];
};
