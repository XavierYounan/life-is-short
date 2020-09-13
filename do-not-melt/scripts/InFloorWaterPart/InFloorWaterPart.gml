/// @description Checks to see if tileIndexition is below the floor height of a given tile, returns how deep in the floor
/// @arg tilemap
/// @arg x
/// @arg y

function InFloorWaterPart(tilemap, x, y) {

	var tileIndex = tilemap_get_at_pixel(tilemap, x, y)

	if (tileIndex > 0) //if pixel is in a tile
	{
		if (tileIndex == 1) return (y mod TILE_SIZE); //solid tile
	
		var theFloor = global.heightsFromTop[(x mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
		return CheckWaterPart((y mod TILE_SIZE) - theFloor,x,y);
	} 
	else return CheckWaterPart( -(TILE_SIZE - (y mod TILE_SIZE)),x,y);

}

function CheckWaterPart(response,x,y){
	if(place_meeting(x,y,oWaterParticle)) return 0;
	else return response;
}
