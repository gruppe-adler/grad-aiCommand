#include "script_component.hpp"

params [["_mode","SINGLE"]];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};


switch (_mode) do {
    case ("SINGLE"): {
        deleteWaypoint _currentWaypoint;
    };

    case ("ALL"): {
        _group = group _currentUnit;
        while {(count waypoints _group) > 0} do {
            deleteWaypoint ((waypoints _group) select 0);
        };
    };
};
