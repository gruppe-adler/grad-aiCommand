#include "script_component.hpp"

params ["_group"];

private _groupLeader = leader _group;

closeDialog 0;
diwako_dui_main_toggled_off = true;
showCinemaBorder false;

GVAR(bodycamTarget) = "Sign_Sphere10cm_F" createVehicleLocal position player;
hideObject GVAR(bodycamTarget);

GVAR(bodycamCam) = "camera" camCreate getPosATL _groupLeader;
GVAR(bodycamCam) camPrepareFov 0.700;
GVAR(bodycamCam) camCommitPrepared 0;

[_groupLeader] call FUNC(setBodycamHost);
[] call FUNC(createBodycamOverlay);
