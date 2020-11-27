//Get layers
var uiLayer = layer_get_id("UserInterface")
var sunLayer = layer_get_id("Sun")

if(uiLayer ==-1 || sunLayer == -1){
	debug_log("Could not find ui or sun layer", ERROR_LEVEL.WARNING)          
}

//Create objects with scales
sunIntensity = instance_create_layer(883,521,uiLayer,oSunIntensity);
sunIntensity.xScale = 0.2057927
sunIntensity.yScale = 0.125

sunMeltBar = instance_create_layer(13,521,uiLayer,oSunMelt);
sunMeltBar.xScale = 0.4189453
sunMeltBar.yScale = 0.25

//Acess sun object
//object is placed in the room so the height is different per room
sun = instance_find(oSun,0)
if(sun ==-4){
	debug_log("Couldnt find sun instance in room", ERROR_LEVEL.WARNING)	
}

//Setup variables
roomModifier = 1; //temp for now but later levels will be harder
intensity = 0;
intensityMeltTime = [20,15,10,6,2] //secconds for the bar 

barSecconds = intensityMeltTime[intensity]