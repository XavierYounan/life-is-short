/*
/// @description Insert description here
// You can write your code in this editor
var length = array_length(waterParticles)

for(var i=0; i<length; i++){ //update oldest particles first to improve flow effect
	waterParticles[i].Step();
}
*/

if(keyboard_check_pressed(ord("Q"))){
	display = (display + 1) mod 2
}


if(mouse_check_button(mb_left))
{
	var mouseX = mouse_x;
	var mouseY = mouse_y;
	
	for(var i=0; i<6; i++){
		for(var j=0; j<6; j++){
			var xx = mouseX-2 + i;
			var yy = mouseY-2 + j;
			
			if(waterCells[xx][yy] = waterType.air){
				var ls = ds_list_create()
				ds_list_add(ls,xx,yy)
	
				waterCells[xx][yy] = ls;
				water[waterLength] = ls;
				waterLength++;
			} //else add pressure at location
			
			
		}
	}
}

//Simulate waters movemnts
//Move down if can

for(var i=0; i<waterLength; i++){ //For each water particle
	var xx = water[i][| waterRef.xx];
	var yy = water[i][| waterRef.yy];
	
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
		}
		
		if(left){
			waterCells[xx-1][yy] = waterCells[xx][yy];//Move cell reference
			water[i][| waterRef.xx] = xx-1; //Change ds_list reference
			waterCells[xx][yy] = waterType.air; //Set old cell to air
		}
	}
} 