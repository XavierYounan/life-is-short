var length = array_length(waterParticles)
if(length){
	shader_set(shWater);

	xArray = []
	yArray = []


	for(var i=length-1; i>-1; i--){
		xArray[i] = waterParticles[i].x;
		yArray[i] = waterParticles[i].y;
	}

	shader_set_uniform_i(sizePointer, length);
	shader_set_uniform_i_array(xArrayPointer, xArray);
	shader_set_uniform_i_array(yArrayPointer, yArray);

	draw_self();
	shader_reset();
}