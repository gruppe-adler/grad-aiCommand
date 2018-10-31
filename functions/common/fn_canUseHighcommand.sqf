#include "script_component.hpp"

params [["_player",objNull]];

alive _player &&
{_player getVariable [QGVAR(canUseHighcommand),GVAR(canUseHighcommandDefault)]}
