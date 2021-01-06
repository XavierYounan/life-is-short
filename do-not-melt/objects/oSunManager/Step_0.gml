if(keyboard_check_pressed(vk_space)){
	
	
	intensity++ //Increment intensity
	
	//Run before intensity cap so it doesnt re do animation for case 4
	switch(intensity){
		case 1:
			var t = TweenFire(sun,EaseInOutSine,0,true,0,1,"tri1Boost",0,global.sunBoostMax)
			TweenAddCallback(t,TWEEN_EV_FINISH,id,BoostShrink,intensity)

		break;
		case 2:
			var t = TweenFire(sun,EaseInOutSine,0,true,0,1,"tri2Boost",0,global.sunBoostMax)
			TweenAddCallback(t,TWEEN_EV_FINISH,id,BoostShrink,intensity)
		break;
		case 3:
			var t = TweenFire(sun,EaseInOutSine,0,true,0,1,"tri3Boost",0,global.sunBoostMax)
			TweenAddCallback(t,TWEEN_EV_FINISH,id,BoostShrink,intensity)
		break;
		case 4:
			var t = TweenFire(sun,EaseInOutSine,0,true,0,1,"tri4Boost",0,global.sunBoostMax)
			TweenAddCallback(t,TWEEN_EV_FINISH,id,BoostShrink,intensity)
		break;
	}
	
	
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

//Set the lifespan bar to the desired time

	
