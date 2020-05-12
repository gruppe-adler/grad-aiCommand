#include "script_component.hpp"

diwako_dui_main_toggled_off = false;

GVAR(bodycamCam) cameraEffect ["terminate","back"];
camDestroy GVAR(bodycamCam);

private _display = uiNamespace getVariable [QGVAR(bodycamOverlayDisplay),displayNull];
if (!isNull _display) then {
    _display closeDisplay 2;
};
