/*
var length = array_length(xArray)
var obj = oWaterParticleMangaer

if(length){
	shader_set(shWater);

	shader_set_uniform_i(obj.arrayLengthPointer, length);
	shader_set_uniform_i_array(obj.xArrayPointer, obj.xArray);
	shader_set_uniform_i_array(obj.yArrayPointer, obj.yArray);
	
	draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
	
	shader_reset();
}else{
	draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
}
*/