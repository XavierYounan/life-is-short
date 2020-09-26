if(keyboard_check_pressed(ord("E"))){
	debug_log("Info",ERROR_LEVEL.INFO)
}

if(keyboard_check_pressed(ord("R"))){
	debug_log("Debug",ERROR_LEVEL.DEBUG)
}
 
if(keyboard_check_pressed(ord("T"))){
	debug_log("Warning test",ERROR_LEVEL.WARNING)
}

if(keyboard_check_pressed(ord("Y"))){
	debug_log("Error Test",ERROR_LEVEL.ERROR)
}

if(keyboard_check_pressed(ord("U"))){
	debug_log("Fatal",ERROR_LEVEL.FATAL)
}