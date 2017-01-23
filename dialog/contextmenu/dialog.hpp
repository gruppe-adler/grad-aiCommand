class grad_aicommand_contextmenu {
    idd = grad_aicommand_contextmenu_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    onLoad = "missionNamespace setVariable ['grad_aicommand_contextmenu_isOpen',true]";
    onUnload = "missionNamespace setVariable ['grad_aicommand_contextmenu_isOpen',false]";

    class ControlsBackground {};
    class Controls {};
};
