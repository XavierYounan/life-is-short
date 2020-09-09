/// @description Insert description here
// You can write your code in this editor
var length = array_length(waterParticles)

for(var i=length-1; i>-1; i--){
	waterParticles[i].Step();
		
	xArray[i] = waterParticles[i].x;
	yArray[i] = waterParticles[i].y;
}

	
		

