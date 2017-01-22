#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_aicommand {
    class commandwindow {
        file = MODULES_DIRECTORY\grad-aicommand\functions\commandwindow;

        class addEHs {};
        class closeCommandWindow {};
        class deleteAllWaypointMarkers {};
        class deleteCurrentUnitMarkers {};
        class drawCurrentUnitMarkers {};
        class onMapSingleClick {};
        class onRightClick {};
        class openCommandWindow {};
        class removeAllEHs {};
        class updateMap {};
    };

    class common {
        file = MODULES_DIRECTORY\grad-aicommand\functions\common;

        class createArrowMarker {};
        class deleteArrowMarker {};
        class executeWaypoints {};
        class initModule {postInit = 1;};
    };
};
