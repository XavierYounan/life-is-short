show_debug_message("recieved");
var type = async_load[? "type"];
var value = async_load[? "value"];
var handle = async_load[? "handle"];

switch(type){
	case Task.EmptyScript:
		script_execute(value);
	break;
	
	default:
		show_debug_message("Received invalid Task Type " +  string(type));
		
	break;
		
}

task_join(handle);