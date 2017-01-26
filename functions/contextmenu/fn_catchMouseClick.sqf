systemChat "catch mouse click";

_button = _this select 1;
if (_button == 1) then {
    [false] call grad_aicommand_fnc_openContextMenu;
};

true
