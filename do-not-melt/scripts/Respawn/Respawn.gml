// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Respawn(camera){
	var obj = instance_create_depth(x,y,height.instances,oIceCube)
	camera.player = obj
	cubes--;
	
	with(oSun){
		timeA = 0;
		ratio = 0;
	}
	
}