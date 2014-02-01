private ["_menuDef", "_positions", "_active_radio", "_submenu", "_command"];
if ((count (call TFAR_fnc_radiosList) > 1) or {(count (call TFAR_fnc_radiosList) == 1) and !(call TFAR_fnc_haveSWRadio) }) then
{
	_menuDef = ["main", localize "STR_select_radio", "buttonList", "", false];
	_positions = [];
	{
		_command = format["TF_sw_dialog_radio = '%1';call TFAR_fnc_onSwDialogOpen;", _x];
		_submenu = "";
		_active_radio = call TFAR_fnc_activeSwRadio;
		if ((isNil "_active_radio") or {_x != _active_radio}) then
		{
			_command = format["TF_sw_dialog_radio = '%1';", _x];
			_submenu = "_this call TFAR_fnc_swRadioSubMenu";
		};
		_position = [
			getText(configFile >> "CfgWeapons"  >> _x >> "displayName"), 
			_command, 
			getText(configFile >> "CfgWeapons"  >> _x >> "picture"),
			"",
			_submenu,
			-1,
			true,
			true
		];
		_positions set [count _positions, _position];
	} forEach (call TFAR_fnc_radiosList);
	_menu =
	[
		_menuDef,
		_positions	
	];
	_menu
} else {
	if (call TFAR_fnc_haveSWRadio) then {
		TF_sw_dialog_radio = call TFAR_fnc_activeSwRadio;
		call TFAR_fnc_onSwDialogOpen;
	};
	nil
};