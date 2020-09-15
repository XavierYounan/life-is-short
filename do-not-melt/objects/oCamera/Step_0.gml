if(player != noone){
	#region Follow the player
	xTo = player.x + (mouse_x - player.x)/4 
	yTo = player.y + (mouse_y - player.y)/4 

	x += (xTo - x)/25
	y += (yTo - y)/25
		
	//Dont let it go outside
	x = clamp(x,cameraWidth/2 + TILE_SIZE,room_width - cameraWidth/2 - TILE_SIZE)
	y = clamp(y,cameraHeight/2 + TILE_SIZE,room_height - cameraHeight/2)

	var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
	camera_set_view_mat(camera,vm);
		
	#endregion
}else{
	var xx = room_width/2;
	var yy = room_height/2
	var vm = matrix_build_lookat(xx,yy,depthMin,xx,yy,0,false,true,false);
	camera_set_view_mat(camera,vm);
}
	
	
