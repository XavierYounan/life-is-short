if(keyboard_check_pressed(vk_space)){
	intensity++ //Increment intensity
	intensity = min(intensity,4); //Cap Intensity at 4
	sunIntensity.index = intensity; //Update the intensity indicator
	sun.intensity = intensity;
	barSecconds = intensityMeltTime[intensity] //reset bar secconds
	
	//Melt
	var cubeX = oIceCube.x;
	var cubeY = oIceCube.y;
	
	for(var i=0; i<meltOutsideBorder;i++){
	for(var j=0; j<meltOutsideBorder;j++){
			
	//Check compatiable 
	if((i <= meltBorderDiff) || (i >= meltOutsideBorder-meltBorderDiff) ||  (j<= meltBorderDiff) || (j > meltOutsideBorder - meltBorderDiff)){

		var xx = cubeX - meltOutsideBorder/2 + i;
		var yy = cubeY - meltOutsideBorder/2 + j;
			
		with(oWaterParticleManger){
			if(waterCells[xx][yy] = waterType.air){
				var ls = ds_list_create()
				ds_list_add(ls,xx,yy)
	
				waterCells[xx][yy] = ls;
				water[waterLength] = ls;
				waterLength++;
			} //else add pressure at locatio
		}
	}}}	
}

//Increment bar secconds
var dt = global.dt_steady;
barSecconds -= dt;

if(barSecconds <= 0){
	barSecconds = intensityMeltTime[intensity] //reset bar secconds
	//Melt
	var cubeX = oIceCube.x;
	var cubeY = oIceCube.y;
	
	for(var i=0; i<meltOutsideBorder;i++){
	for(var j=0; j<meltOutsideBorder;j++){
			
	//Check compatiable 
	if((i <= meltBorderDiff) || (i >= meltOutsideBorder-meltBorderDiff) ||  (j<= meltBorderDiff) || (j > meltOutsideBorder - meltBorderDiff)){

		var xx = cubeX - meltOutsideBorder/2 + i;
		var yy = cubeY - meltOutsideBorder/2 + j;
			
		with(oWaterParticleManger){
			if(waterCells[xx][yy] = waterType.air){
				var ls = ds_list_create()
				ds_list_add(ls,xx,yy)
	
				waterCells[xx][yy] = ls;
				water[waterLength] = ls;
				waterLength++;
			} //else add pressure at locatio
		}
	}}}
}

//Send the bar percent to the ui
sunMeltBar.percent = barSecconds/intensityMeltTime[intensity];	
	
