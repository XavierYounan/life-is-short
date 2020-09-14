if(display){
	draw_set_alpha(0.8)
	for(var i=0; i<waterLength; i++){
		var xx = water[i][| waterRef.xx];
		var yy = water[i][| waterRef.yy];
		
		draw_sprite(sWaterPart,0,xx,yy);
	}
	draw_set_alpha(1);
}