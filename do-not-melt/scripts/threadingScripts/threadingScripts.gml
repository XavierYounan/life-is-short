// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sTaskTest(){
	show_debug_message("Hello World")
}

function sTaskInit(milliseconds, task_type, return_value, args = 0){
	var task = task_init(milliseconds, task_type, return_value);
	
	ds_map_add(global.args, task, args);
	
	return task
}