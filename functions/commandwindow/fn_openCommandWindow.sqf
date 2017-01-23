params ["_unit","_player"];

systemChat "openCommandWindow";

missionNamespace setVariable ["grad_aicommand_currentUnit",_unit];
missionNamespace setVariable ["grad_aicommand_currentUnitMarkers",[_unit] call grad_aicommand_fnc_drawCurrentUnitMarkers];
missionNamespace setVariable ["grad_aicommand_currentWaypoints",[[getPos _unit,"UNCHANGED",[0,0,0],"MOVE",["true",""]]]];
missionNamespace setVariable ["grad_aicommand_currentArrowMarkers",[]];

[] call grad_aicommand_fnc_addEHs;
openMap [true,false];
