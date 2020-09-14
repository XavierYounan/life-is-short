/*
/// @description Insert description here
// You can write your code in this editor
var length = array_length(waterParticles)

for(var i=0; i<length; i++){ //update oldest particles first to improve flow effect
	waterParticles[i].Step();
}
*/

if(keyboard_check_pressed(ord("Q"))){
	display = (display + 1) mod 2
}

