#include "script_component.hpp"

params ["_map"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _color = [side _currentGroup] call FUNC(getSideColor);

{
    _map drawIcon ["iconMan",_color,getPos _x,24,24,getDir _x,"",0,0.03,'TahomaB','right'];
    false
} count (units _currentGroup);
