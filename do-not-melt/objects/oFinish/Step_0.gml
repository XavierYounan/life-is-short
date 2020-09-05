var obj = instance_place(x, y, oIceCube);

if(obj){
	instance_destroy(obj);
	with(oStart){
		Respawn(camera);	
	}
}