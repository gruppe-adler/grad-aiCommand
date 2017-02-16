#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_aicommand {
    class commandwindow {
        file = MODULES_DIRECTORY\grad-aicommand\functions\commandwindow;

        class addEHs {};
        class drawArrows {};
        class drawCurrentUnits {};
        class findNearestWP {};
        class onMapSingleClick {};
        class onRightClick {};
        class onUnload {};
        class openCommandWindow {};
        class removeAllEHs {};
    };

    class common {
        file = MODULES_DIRECTORY\grad-aicommand\functions\common;

        class executeWaypoints {};
        class initModule {postInit = 1;};
    };

    class contextmenu {
        file = MODULES_DIRECTORY\grad-aicommand\functions\contextmenu;

        class catchMouseClick {};
        class createButton {};
        class createSubmenu {};
        class createWaypointMenu {};
        class deleteWP {};
        class hideContextMenuItems {};
        class openContextMenu {};
        class setWPSpeed {};
        class setWPTimeout {};
        class setWPType {};
        class updateContextMenu {};
    };
};
