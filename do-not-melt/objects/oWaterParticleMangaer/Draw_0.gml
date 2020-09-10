waterSurface = surface_create(oCamera.cameraWidth,oCamera.cameraHeight);
surface_set_target(waterSurface);

for(var i=0; i<visibleParticles; i++){
	var xx = visibleParticles[i][0];
	var yy = visibleParticles[i][1];
	
	draw_sprite_ext(sWaterPart,0,xx,yy,1,1,0,-1,waterTransparency)
}
surface_reset_target()
draw_surface(waterSurface,0,0);
surface_free(waterSurface);