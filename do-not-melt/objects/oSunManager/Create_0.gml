baseW = 5760;
baseH = 3240;

//Get layers
uiLayer = layer_get_id("UserInterface")
var sunLayer = layer_get_id("Sun")

if(uiLayer ==-1 || sunLayer == -1){
	debug_log("Could not find ui or sun layer", ERROR_LEVEL.WARNING)          
}

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

//Get Rid
meltOutsideBorder = 19;
meltInsideBorder = 10;
meltBorderDiff = ceil((meltOutsideBorder-meltInsideBorder)/2);
		
//Create objects with scales
sunIntensity = instance_create_layer(0 ,0,uiLayer,oSunIntensity);
with(sunIntensity){
	baseX = 5073;
	baseY = 2944;
	baseXScale = 1.281837;
	baseYScale = 0.8984375;
}
		
sunMeltBar = instance_create_layer(0,0,uiLayer,oSunMelt);
with(sunMeltBar){
	baseX = 64;
	baseY = 2944;
	baseXScale = 2.420898;
	baseYScale = 1.796875;		
}

