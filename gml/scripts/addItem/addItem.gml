/// @function addItem(itemName: string)
/// @description Adds an item to the player's inventory.
/// @argument {String} itemName Name of item to add
/// @return {Bool}

function addItem(itemName) {
	if (array_length(global.inventory) != 8) {
		array_push(global.inventory, itemName);
		return true;
	} else {
		return false;
	}
}