params [["_mode","SINGLE"]];

_waypoints = missionNamespace getVariable ["grad_aicommand_currentWaypoints",[]];

switch (_mode) do {
    case ("SINGLE"): {
        _wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
        if (_wpIndex < 0) exitWith {};
        _waypoints deleteAt _wpIndex;
    };

    case ("ALL"): {
        while {count _waypoints > 1} do {
            _waypoints deleteAt 1;
        };
    };
};
