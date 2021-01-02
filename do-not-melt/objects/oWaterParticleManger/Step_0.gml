if(keyboard_check_pressed(ord("Q"))){
	display = (display + 1) mod 2
}


//Simulate water movement
for(var i=0; i<waterLength; i++){ //For each water particle
	var xx = water[i][| waterRef.xx];
	var yy = water[i][| waterRef.yy];
	
	
	//Move down if can
	if(waterCells[xx][yy+1] == waterType.air){		
		waterCells[xx][yy+1] = waterCells[xx][yy];//Move cell reference
		water[i][| waterRef.yy] = yy+1; //Change ds_list reference
		waterCells[xx][yy] = waterType.air; //Set old cell to air		
	}else{
		var left = (waterCells[xx-1][yy] == waterType.air)
		var right = (waterCells[xx+1][yy] == waterType.air)
		
		if(right && left){
			right = right - lastDir;
			left = lastDir;
			lastDir = (lastDir + 1) mod 2
		}
		
		if(right){			
			waterCells[xx+1][yy] = waterCells[xx][yy];//Move cell reference
			water[i][| waterRef.xx] = xx+1; //Change ds_list reference
			waterCells[xx][yy] = waterType.air; //Set old cell to air			
		}else{
			if(left){
				waterCells[xx-1][yy] = waterCells[xx][yy];//Move cell reference
				water[i][| waterRef.xx] = xx-1; //Change ds_list reference
				waterCells[xx][yy] = waterType.air; //Set old cell to air
			}
		}
	}
}


//Simulate waters movemnts
/*
for(var i=0; i<waterLength; i++){ //For each water particle
	var xx = water[i][| waterRef.xx];
	var yy = water[i][| waterRef.yy];
	var deactivated = water[i][| waterRef.deactivated];

	if(deactivated < deactivateFrames){
		//Move down if can
		if(waterCells[xx][yy+1] == waterType.air){
			
			waterCells[xx][yy+1] = waterCells[xx][yy];//Move cell reference
			water[i][| waterRef.yy] = yy+1; //Change ds_list reference
			water[i][| waterRef.deactivated] = 0; //just moved this frame
			waterCells[xx][yy] = waterType.air; //Set old cell to air
			
		}else{
			var left = (waterCells[xx-1][yy] == waterType.air)
			var right = (waterCells[xx+1][yy] == waterType.air)
		
			if(right && left){
				right = right - lastDir;
				left = lastDir;
			
				lastDir = (lastDir + 1) mod 2
			}
		
			if(right){
				
				waterCells[xx+1][yy] = waterCells[xx][yy];//Move cell reference
				water[i][| waterRef.xx] = xx+1; //Change ds_list reference
				water[i][| waterRef.deactivated] = 0; //just moved this frame
				waterCells[xx][yy] = waterType.air; //Set old cell to air
				
			}else{
				if(left){
					waterCells[xx-1][yy] = waterCells[xx][yy];//Move cell reference
					water[i][| waterRef.xx] = xx-1; //Change ds_list reference
					water[i][| waterRef.deactivated] = 0; //just moved this frame
					waterCells[xx][yy] = waterType.air; //Set old cell to air
				}else{
					water[i][| waterRef.deactivated] += 1;	
				}
			}
		}
	}
} 
*/