// From https://forum.gamemaker.io/index.php?threads/is-it-possible-to-get-color-code-from-string.113290/

/// @param hexcodeString
/// @param [default=#FFFFFF]

function hextoclr(_hexcodeString, _default = #FFFFFF) {
    if (not is_string(_hexcodeString)) {
        return is_numeric(_hexcodeString) ? _hexcodeString : _default;
    }

    try {
        var _color = int64(ptr(string_replace(_hexcodeString, "#", "")));
        _color = ((_color & 0xFF0000) >> 16) | (_color & 0x00FF00) | ((_color & 0x0000FF) << 16);
        return _color;
    }
	
    catch(_exception) {
        return _default;
    }
}