///@description Build height table then start game

draw_tilemap(tilemapid,0,0);
global.heightsFromTop[heightsToGet - 1] = 0; // Predefine  the last element in the array to reserve space

for (var i = heightsToGet-1; i >= 0; i--) //(x,y) = (0,0) is first point
{
	var check = 0;
	while(true)
	{	
		if(check = TILE_SIZE) break;
		if(surface_getpixel(application_surface, i, check) != c_black) break;
		check ++;
	}
	global.heightsFromTop[i] = check;
	
}

room_goto_next()