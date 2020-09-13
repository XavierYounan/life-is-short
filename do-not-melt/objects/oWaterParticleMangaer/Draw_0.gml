/*
waterSurface = surface_create(oCamera.cameraWidth,oCamera.cameraHeight);
surface_set_target(waterSurface);
*/
var len = array_length(waterParticles)
for(var i=0; i<len; i++){
	var xx = waterParticles[i].x;
	var yy = waterParticles[i].y;
	
	draw_sprite(sWaterPart,0,xx,yy)

	
}

/*
surface_reset_target()
draw_surface(waterSurface,0,0);
surface_free(waterSurface);
*/