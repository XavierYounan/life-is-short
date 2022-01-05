/// @description Insert description here
// You can write your code in this editor
enum Task {
	EmptyScript = 0,
	
}

global.args = noone;
global.args = ds_map_create();


task_init(1000,Task.EmptyScript,sTaskTest)
show_debug_message("task sent")

