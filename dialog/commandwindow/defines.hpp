#define GRAD_AICOMMAND_COMMANDWINDOW_DIALOG         57000
#define GRAD_AICOMMAND_COMMANDWINDOW_MAP            57100
#define GRAD_AICOMMAND_CONTEXTMENU_GROUP            57200
#define GRAD_AICOMMAND_CONTEXTMENU_SUBMENU          57300
#define GRAD_AICOMMAND_RENAMEGROUP_GROUP            57400
#define GRAD_AICOMMAND_RENAMEGROUP_TITLE            57401


#define GRAD_AICOMMAND_SPACER_Y                     (Y_SCALE * 0.002)
#define GRAD_AICOMMAND_PADDING_X                    (X_SCALE * 0.008)

#define GRAD_AICOMMAND_RENAMEGROUP_W                (X_SCALE * 0.40)
#define GRAD_AICOMMAND_RENAMEGROUP_H                (Y_SCALE * 0.05)

#define GRAD_AICOMMAND_RENAMEGROUP_TITLEBAR_H       (Y_SCALE * 0.025)

#define GRAD_AICOMMAND_RENAMEGROUP_X                CENTER(safeZoneW,GRAD_AICOMMAND_RENAMEGROUP_W)
#define GRAD_AICOMMAND_RENAMEGROUP_Y                CENTER(safeZoneH,GRAD_AICOMMAND_RENAMEGROUP_H)

#define GRAD_AICOMMAND_RENAMEGROUP_BG_Y             (GRAD_AICOMMAND_RENAMEGROUP_Y + GRAD_AICOMMAND_RENAMEGROUP_TITLEBAR_H + GRAD_AICOMMAND_SPACER_Y)
#define GRAD_AICOMMAND_RENAMEGROUP_BG_H             (GRAD_AICOMMAND_RENAMEGROUP_H - GRAD_AICOMMAND_SPACER_Y - GRAD_AICOMMAND_RENAMEGROUP_TITLEBAR_H)

#define GRAD_AICOMMAND_RENAMEGROUP_EDIT_X           (GRAD_AICOMMAND_RENAMEGROUP_X + GRAD_AICOMMAND_PADDING_X)
#define GRAD_AICOMMAND_RENAMEGROUP_EDIT_Y           (GRAD_AICOMMAND_RENAMEGROUP_Y + GRAD_AICOMMAND_RENAMEGROUP_TITLEBAR_H + GRAD_AICOMMAND_SPACER_Y + GRAD_AICOMMAND_RENAMEGROUP_BG_H / 2)
#define GRAD_AICOMMAND_RENAMEGROUP_EDIT_W           (GRAD_AICOMMAND_RENAMEGROUP_W - 2 * GRAD_AICOMMAND_PADDING_X)
#define GRAD_AICOMMAND_RENAMEGROUP_EDIT_H           (Y_SCALE * 0.025)
