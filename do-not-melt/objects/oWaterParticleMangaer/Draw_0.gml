var length = array_length(xArray)
if(length){
	shader_set(shWater);

	shader_set_uniform_i_array(xArrayPointer, xArray);
	shader_set_uniform_i_array(yArrayPointer, yArray);

	draw_self();
	shader_reset();
}