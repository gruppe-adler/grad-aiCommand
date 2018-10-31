#include "script_component.hpp"

params ["_map"];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _color = [side _currentUnit] call FUNC(getSideColor);

{
    _map drawIcon ["iconMan",_color,getPos _x,24,24,getDir _x,"",0,0.03,'TahomaB','right'];
    false
} count (units group _currentUnit);
