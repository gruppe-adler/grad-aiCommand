params ["_map"];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];

if (isNull _currentUnit) exitWith {};

_color = switch (side _currentUnit) do {
    case (WEST): {
        [0,0.3,0.6,1]
    };
    case (EAST): {
    	[0.5,0,0,1]
    };
    case (INDEPENDENT): {
        [0,0.5,0,1]
    };
    default {
        [0.7,0.6,0,1]
    };
};

{
    _map drawIcon ["iconMan",_color,getPos _x,24,24,getDir _x,"",0,0.03,'TahomaB','right'];
} forEach (units group _currentUnit);
