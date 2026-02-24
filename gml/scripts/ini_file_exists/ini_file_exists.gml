/// @function ini_file_exists(ini_filepath)
/// @description Checks if an ini file exists.
/// @argument {String} ini_filepath The ini filepath to check
/// @return {Bool}

function ini_file_exists(ini_filepath) {
	ini_open(ini_filepath);
	if !ini_key_exists("misc", "file_exists") {
		ini_close();
	    return false;
	} else {
		ini_close();
	    return true;
	}
}