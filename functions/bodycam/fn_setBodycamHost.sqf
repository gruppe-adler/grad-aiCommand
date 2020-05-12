#include "script_component.hpp"

params [["_newHost",objNull]];

private _camOffset = [0,0,0];
private _targetOffSet = [0,0,0];
private _hostMempoint = "";

private _objectParent = objectParent _newHost;
if (isNull _objectParent) then {
    _camOffset = [0.18,-0.2,0.12];
    _targetOffSet = [2,8,1];
    _hostMempoint = "Head";

} else {
    _camOffset = [0.05,-0.2,0.60];
    _targetOffSet = [2,8,1];
    _hostMempoint = "";

    // tanks and apcs don't have modeled interior for outside spectator
    if (_objectParent isKindOf "Tank_F" || _objectParent isKindOf "Wheeled_Apc_F") then {

    };
};

GVAR(bodycamTarget) attachTo [_newHost,_targetOffSet];
GVAR(bodycamCam) attachTo [_newHost,_camOffSet,_hostMempoint];
GVAR(bodycamCam) cameraEffect ["INTERNAL","BACK"];

GVAR(bodycamCam) camPrepareTarget _target;
GVAR(bodycamCam) camCommitPrepared 0;

GVAR(bodycamCurrentHost) = _newHost;
