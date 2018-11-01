#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_aicommand {
    class commandwindow {
        file = MODULES_DIRECTORY\grad-aicommand\functions\commandwindow;

        class addEHs {};
        class drawArrows {};
        class drawEditableGroups {};
        class drawIndividualUnits {};
        class findNearestEditableGroup {};
        class findNearestWP {};
        class onLeftClick {};
        class onRightClick {};
        class onUnload {};
        class openCommandWindow {};
        class removeAllEHs {};
        class setGroupIndividualUnits {};
        class updateEditableGroups {};
    };

    class common {
        file = MODULES_DIRECTORY\grad-aicommand\functions\common;

        class canGiveCommands {};
        class executeWaypoints {};
        class getSideColor {};
        class initModule {postInit = 1;};
        class isEditableGroup {};
        class joinNearestGroup {};
        class leaveGroup {};
        class setCanGiveCommands {};
        class setCanReceiveCommands {};
        class setGivePermissionLevel {};
        class setReceivePermissionLevel {};
        class waitASecond {};
        class waypointGarrison {};
    };

    class contextmenu {
        file = MODULES_DIRECTORY\grad-aicommand\functions\contextmenu;

        class catchMouseClick {};
        class createButton {};
        class createGroupMenu {};
        class createSubmenu {};
        class createWaypointMenu {};
        class deleteWP {};
        class hideContextMenuItems {};
        class openContextMenu {};
        class setWPSpeed {};
        class setWPStatement {};
        class setWPTimeout {};
        class setWPType {};
        class updateContextMenu {};
    };
};
