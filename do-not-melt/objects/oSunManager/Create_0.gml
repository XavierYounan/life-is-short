baseW = 5760;
baseH = 3240;

//Get layers
uiLayer = layer_get_id("UserInterface")
var sunLayer = layer_get_id("Sun")

if(uiLayer ==-1 || sunLayer == -1){
	debug_log("Could not find ui or sun layer", ERROR_LEVEL.WARNING)          
}

createdObjects = false;
objectCreationTrigger = false;

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