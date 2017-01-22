params ["_unit"];

_markerType = switch (side _unit) do {
    case (WEST): {
        "b_inf"
    };
    case (EAST): {
        "o_inf"
    };
    case (INDEPENDENT): {
        "n_inf"
    };
    default {
        "b_unknown"
    };
};

_currentUnitMarkers = [];
{
    _marker = createMarkerLocal [format ["grad_aicommand_currentUnitMarker_%1",_forEachIndex],getPos _x];
    _marker setMarkerTypeLocal _markerType;

    _currentUnitMarkers pushBack _marker;
} forEach (units group _unit);


_currentUnitMarkers
