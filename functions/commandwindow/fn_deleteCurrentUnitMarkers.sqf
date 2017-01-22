params [["_markers",missionNamespace getVariable ["grad_aicommand_currentUnitMarkers",[]]]];

{
    deleteMarkerLocal _x;
} forEach _markers;
