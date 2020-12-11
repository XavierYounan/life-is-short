if(keyboard_check_pressed(vk_space)){
	intensity++ //Increment intensity
	intensity = min(intensity,4); //Cap Intensity at 4
	sunIntensity.index = intensity; //Update the intensity indicator
	barSecconds = intensityMeltTime[intensity] //reset bar secconds
	//Melt
}

//Increment bar secconds
var dt = global.dt_steady;
barSecconds -= dt;

if(barSecconds <= 0){
	barSecconds = intensityMeltTime[intensity] //reset bar secconds
	//Melt
}

//Send the bar percent to the ui
sunMeltBar.percent = barSecconds/intensityMeltTime[intensity];	
	
