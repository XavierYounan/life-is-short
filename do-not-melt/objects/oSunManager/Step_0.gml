if(createdObjects){
	if(keyboard_check_pressed(vk_space)){
		intensity++ //Increment intensity
		intensity = min(intensity,4); //Cap Intensity at 4
		sunIntensity.image_index = intensity; //Update the intensity indicator
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
	

}else{
	if(instance_exists(oCamera)){
		xScale = oCamera.guiWidth/baseW;
		yScale = oCamera.guiHeight/baseH;
		
		//Create objects with scales
		sunIntensity = instance_create_layer(5073 * xScale ,2944 * yScale,uiLayer,oSunIntensity);
		sunIntensity.xScale = 1.281837 * xScale
		sunIntensity.yScale = 0.8984375 * yScale

		sunMeltBar = instance_create_layer(64 * xScale,2944 * yScale,uiLayer,oSunMelt);
		sunMeltBar.xScale = 2.420898 * xScale
		sunMeltBar.yScale = 1.796875 * yScale

		
		createdObjects = true;
	}	
}








