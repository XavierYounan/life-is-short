/*
waterSurface = surface_create(oCamera.cameraWidth,oCamera.cameraHeight);
surface_set_target(waterSurface);
*/

/*
var len = array_length(waterParticles)
for(var i=0; i<len; i++){
	var xx = waterParticles[i].x;
	var yy = waterParticles[i].y;
	
	draw_sprite(sWaterPart,0,xx,yy)

	
}
*/

/*
surface_reset_target()
draw_surface(waterSurface,0,0);
surface_free(waterSurface);
*/

if(display){
	//Only draw sprites in view angle
	var xStart, xFinish, yStart, yFinish
	with(oCamera){
		xStart = max(x - cameraWidth,0);
		xFinish = min(x + cameraWidth,other.roomWidth-1);
		
		yStart = max(y - cameraHeight, 0);
		yFinish = min(y + cameraHeight, other.roomHeight-1);
	}
	
	for(var xx=xStart; xx<xFinish; xx++){
		for(var yy=yStart; yy<yFinish; yy++){
			if(water[xx][yy] == waterType.ground){	
				draw_sprite(sWall,0,xx,yy)
			}
		}
	}
}