#include "script_component.hpp"

/*
    Name: TFAR_fnc_isRadio

    Author(s):
        NKey
        L-H

    Description:
        Checks whether the passed radio is a TFAR radio.

    Parameters:
        STRING - Radio classname

    Returns:
        BOOLEAN

    Example:
        _isRadio = "NotARadioClass" call TFAR_fnc_isRadio;
*/

private _result = getNumber (configFile >> "CfgWeapons" >> _this >> "tf_radio");
if (!isNil "_result") exitWith {_result == 1};

false
