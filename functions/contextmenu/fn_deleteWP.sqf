#include "script_component.hpp"

params [["_mode","SINGLE"]];

private _currentUnit = missionNamespace getVariable [QGVAR(currentUnit),objNull];
if (isNull _currentUnit) exitWith {};

private _currentWaypoint = _currentUnit getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

private _group = group _currentUnit;
private _waypointStatementNames = _group getVariable [QGVAR(waypointStatementNames),[]];

switch (_mode) do {
    case ("SINGLE"): {
        deleteWaypoint _currentWaypoint;
        _waypointStatementNames deleteAt (_currentWaypoint select 1);
        _group setVariable [QGVAR(waypointStatementNames),_waypointStatementNames,true];
    };

    case ("ALL"): {
        while {(count waypoints _group) > 0} do {
            deleteWaypoint ((waypoints _group) select 0);
        };
        _group setVariable [QGVAR(waypointStatementNames),[],true];
    };
};
