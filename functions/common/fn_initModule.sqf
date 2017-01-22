grad_aicommand_canBeGivenCommandsDefault = ([(missionConfigFile >> "CfgGradAICommand" >> "canBeGivenCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_aicommand_canGiveCommandsDefault = ([(missionConfigFile >> "CfgGradAICommand" >> "canGiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;

if (hasInterface) then {
    _condition = {params ["_unit","_player"]; alive _unit && {_unit getVariable ["grad_aicommand_canBeGivenCommands",grad_aicommand_canBeGivenCommandsDefault] && _player getVariable ["grad_aicommand_canGiveCommands",grad_aicommand_canGiveCommandsDefault]}};
    _action = ["grad_aicommand_mainAction", "Give commands", "", {_this call grad_aicommand_fnc_openCommandWindow}, _condition] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
