show_debug_overlay(true)
tilemap = oIceCube.tilemap

grv = 10;

hspDampening = 10 //ten pixels per seccond
hspTransferRatio = 0.8 // this amount of energy goes into the colliding water molecule
vspTransferRatio = 0.8


roomWidth = room_width;
roomHeight = room_height;

enum waterType {
	air = 0,
	ground = 1,
	water = 2,	
}

waterCells = array_create(roomWidth);

var predictedWater = roomWidth;
water = array_create(predictedWater); //Need to change every time there is a new
waterLength = 0;


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
				
				
				/* is there a way this code could be abstracted to not use an if statement? woudl this make it slightly faster
				var yPos = TILE_SIZE - ( y mod TILE_SIZE);
				var heightOfBlock = global.heightsFromTop[(x mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
				
				tile = (yPos - heightOfBlock <= 0)
				*/
				
			}
		}else{
			var tile = waterType.air;	
		}
		
		
		tile = waterCells[xx][yy];
		
	
	}
}

waterTransparency = 0.8;
display = 0;
