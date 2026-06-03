function isExecuted(friendlyCodeName, setExecutedTo=noone) {
	if (!variable_global_exists(friendlyCodeName)) {
		global.isExecutedStruct = {};
	}
	
	if (!variable_struct_exists(global.isExecutedStruct, friendlyCodeName)) {
	    global.isExecutedStruct[$ friendlyCodeName] = false;
	}
	
	if (setExecutedTo != noone) {
		global.isExecutedStruct[$ friendlyCodeName] = setExecutedTo;
	}
	
	return global.isExecutedStruct[$ friendlyCodeName];
	//return false;
}