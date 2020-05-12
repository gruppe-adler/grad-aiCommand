#include "script_component.hpp"

params [["_step",0]];

private _groupUnits = units group GVAR(bodycamCurrentHost);
private _currentID = _groupUnits find GVAR(bodycamCurrentHost);

if (_currentID < 0) exitWith {ERROR_1("Current host %1 not found in current group.",GVAR(bodycamCurrentHost))};

// do this numerically, because i'm too dumb for maths
private _maxID = (count _groupUnits) - 1;
private _nextID = _currentID;
if (_step < 0) then {
    for "_i" from 1 to (abs _step) do {
        _nextID = _nextID - 1;
        if (_nextID < 0) then {_nextID = _maxID}
    };
} else {
    for "_i" from 1 to _step do {
        _nextID = _nextID + 1;
        if (_nextID > _maxID) then {_nextID = 0};
    };
};

private _newHost = _groupUnits param [_nextID,objNull];
[_newHost] call FUNC(setBodycamHost);
