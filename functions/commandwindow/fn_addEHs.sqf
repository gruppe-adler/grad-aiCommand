systemChat "addEHs";


grad_aicommand_mapEH = addMissionEventHandler ["Map",{if !(_this select 0) then {[] call grad_aicommand_fnc_closeCommandWindow}}];

onMapSingleClick {[_pos,_units,_shift,_alt] call grad_aicommand_fnc_onMapSingleClick};

grad_aicommand_mouseButtonEH = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];
    if (_button == 1) then {
        [] call grad_aicommand_fnc_onRightClick;
    };
    false
}];
