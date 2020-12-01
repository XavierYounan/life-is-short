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
	if(objectCreationTrigger){
		var guiWidth = display_get_gui_width()
		var guiHeight = display_get_gui_height()
		
		var xScale = guiWidth/baseW
		var yScale = guiHeight/baseH
		
		//Create objects with scales
		sunIntensity = instance_create_layer(0 ,0,uiLayer,oSunIntensity);
		with(sunIntensity){
			baseX = 5073;
			baseY = 2944;
			baseXScale = 1.281837;
			baseYScale = 0.8984375;
		}
		
		sunMeltBar = instance_create_layer(64 * xScale,2944 * yScale,uiLayer,oSunMelt);
		with(sunMeltBar){
			baseX = 5073;
			baseY = 2944;
			baseXScale = 2.420898;
			baseYScale = 1.796875;
			
			
		}

		createdObjects = true;
	}
}

guiW = display_get_gui_width();
guiH = display_get_gui_height();







