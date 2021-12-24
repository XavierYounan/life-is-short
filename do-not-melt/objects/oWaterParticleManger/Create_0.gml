tilemap = oIceCube.tilemap

grv = 10;

roomWidth = room_width;
roomHeight = room_height;

enum waterType {
	air = -2,
	ground = -1,
}

waterCells = array_create(roomWidth); //Cell manager

//Water particle manager
var predictedWater = roomWidth;
water = array_create(predictedWater); //Need to change every time there is a new
waterLength = 0;

lastDir = 1; //Last direction of water particle 0 is left 1 is right

enum waterRef{
	xx = 0,
	yy = 1,
	//deactivated = 2 //for later
}

//Add all the ground elements
for(var xx=0; xx<roomWidth; xx++){
	for(var yy=roomHeight-1; yy>-1; yy--){
		//sample particle at location
		var tileIndex = tilemap_get_at_pixel(tilemap, xx, yy)

		if (tileIndex > 0) //if pixel is in a tile
		{
			if (tileIndex == 1){//solid tile
				var tile = waterType.ground;
			}else{
				// NON abstracted code
				var yPos = yy mod TILE_SIZE;
				var heightOfBlock = global.heightsFromTop[(xx mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
				
				if(yPos  >=  heightOfBlock){
					tile = waterType.ground;
				}else{
					tile = waterType.air;
				}
			}
		}else{
			var tile = waterType.air;	
		}
		
		waterCells[xx][yy] = tile;
	}
}

waterTransparency = 0.8;
display = 1
deactivateFrames = 30;//lower is better (but not too low)


//disable drawing to the activation screen
//application_surface_draw_enable(false)

