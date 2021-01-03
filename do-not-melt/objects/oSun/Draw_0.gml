if(intensity >= 4){
	draw_sprite_ext(triangles4,0,x,y,xScale,yScale,tri4Rot,c_white,1);
}

if(intensity >= 3){
	draw_sprite_ext(triangles3,0,x,y,xScale,yScale,tri3Rot,c_white,1);
}

if(intensity >= 2){
	draw_sprite_ext(triangles2,0,x,y,xScale,yScale,tri2Rot,c_white,1);
}

if(intensity >= 1){
	draw_sprite_ext(triangles1,0,x,y,xScale,yScale,tri1Rot,c_white,1);
}

draw_sprite_ext(interior,0,x,y,xScale,yScale,intRot,c_white,1);
