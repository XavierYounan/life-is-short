if(mouse_check_button(mb_left))
{
	with(oWaterParticleMangaer){
		var length = array_length(waterParticles)
		var count = 0;
		for(var i=0; i<6; i++){
			for(var j=0; j<6; j++){
				waterCells[mouse_x-2 + i][mouse_y-2 + j]
				
				
				waterParticles[length + count] = new WaterPart(,,0,0)
				count ++;
			}
		}
	}
}

