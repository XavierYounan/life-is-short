if(mouse_check_button(mb_left))
{
	for(var i=0; i<6; i++){
		for(var j=0; j<6; j++){
			instance_create_depth(mouse_x-2 + i,mouse_y-2 + j,height.decor,oWaterParticle)
		}
	}
	
}

