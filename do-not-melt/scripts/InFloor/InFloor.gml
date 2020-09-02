/// @description Checks to see if tileIndexition is below the floor height of a given tile, returns how deep in the floor
/// @arg tilemap
/// @arg x
/// @arg y

function InFloor(tilemap, x, y) {

	var tileIndex = tilemap_get_at_pixel(tilemap, x, y)

	if (tileIndex > 0) //if pixel is in a tile
	{
		if (tileIndex == 1) return (y mod TILE_SIZE); //solid tile
	
		var theFloor = global.heightsFromTop[(x mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
		return ((y mod TILE_SIZE) - theFloor);
	} 
	else return -(TILE_SIZE - (y mod TILE_SIZE));

}
