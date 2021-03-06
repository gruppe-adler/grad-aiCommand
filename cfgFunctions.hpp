#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_aicommand {
    class commandwindow {
        file = MODULES_DIRECTORY\grad-aicommand\functions\commandwindow;

        class addEHs {};
        class createHelpDialog {};
        class drawArrows {};
        class drawEditableGroups {};
        class drawIndividualUnits {};
        class findNearestEditableGroup {};
        class findNearestWP {};
        class onBoxSelected {};
        class onDelKeyUp {};
        class onLeftClick {};
        class onLeftHeldDown {};
        class onRightClick {};
        class onUnload {};
        class openCommandWindow {};
        class removeAllEHs {};
        class setGroupIndividualUnits {};
        class toggleHelp {};
        class updateEditableGroups {};
    };

    class common {
        file = MODULES_DIRECTORY\grad-aicommand\functions\common;

        class addCustomGroupContext {};
        class addCustomWaypointAction {};
        class addCustomWaypointContext {};
        class canGiveCommands {};
        class executeWaypoints {};
        class getSideColor {};
        class getUnitRoleAbbreviation {};
        class groupIdExists {};
        class initModule {postInit = 1;};
        class isEditableGroup {};
        class joinNearestGroup {};
        class leaveGroup {};
        class removeCustomGroupContext {};
        class removeCustomWaypointAction {};
        class removeCustomWaypointContext {};
        class setCanGiveCommands {};
        class setCanReceiveCommands {};
        class setCanUseHighcommand {};
        class setGivePermissionLevel {};
        class setReceivePermissionLevel {};
        class unGarrison {};
        class waitASecond {};
        class waypointGarrison {};
    };

    class contextmenu {
        file = MODULES_DIRECTORY\grad-aicommand\functions\contextmenu;

        class catchMouseClick {};
        class createButton {};
        class createGroupMenu {};
        class createJoinGroupSubmenu {};
        class createKickUnitSubmenu {};
        class createRenameGroupDialog {};
        class createSubmenu {};
        class createWaypointMenu {};
        class deleteWP {};
        class findCoEditedWPs {};
        class forceLeaveVehicle {};
        class hideContextMenuItems {};
        class openContextMenu {};
        class pauseWaypoints {};
        class setWPBehaviour {};
        class setWPCombatMode {};
        class setWPSpeed {};
        class setWPStatement {};
        class setWPTimeout {};
        class setWPType {};
        class submenuJoinGroup {};
        class submenuKickUnit {};
        class toggleRenameGroupDialog {};
        class updateContextMenu {};
    };
};
