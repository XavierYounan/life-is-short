

if(display){
	draw_set_alpha(waterTransparency)
	for(var i=0; i<waterLength; i++){
		var xx = water[i][| waterRef.xx];
		var yy = water[i][| waterRef.yy];
		
		draw_sprite(sWaterPart,0,xx,yy);
	}
	draw_set_alpha(1);
}



/*
variables to pass thorugh to shader

waterTransparency
waterarray (vec2) integers 


/*

shader_set(waterShader)

draw_surface(application_surface,0,0)
shader_reset()

*/