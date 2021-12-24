/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button(mb_left)){
	
	physics_particle_create(flags,mouse_x,mouse_y,0,0,c_white,1,1)
}
physics_particle_delete_region_box(0,room_height-64,room_width/2, 32)