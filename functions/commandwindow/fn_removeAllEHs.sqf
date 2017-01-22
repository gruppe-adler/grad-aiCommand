systemChat "removeAllEHs";

removeMissionEventHandler ["Map", grad_aicommand_mapEH];
onMapSingleClick "";
(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp",grad_aicommand_mouseButtonEH];




/*["grad_aicommand_mapClickEH","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;*/
