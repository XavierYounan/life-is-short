// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
WaterPart = function(_x, _y, _hsp, _vsp) constructor
{
	//Constructer sets x and y
	hsp = _hsp; // pixels per seccond
	vsp = _vsp; // Pixels per seccond

	hMove = 0; //Pixels this frame
	vMove = 0; //Pixels this frame

	hMoveFrac = 0; // Pixels rounded last frame
	vMoveFrac = 0;  // Pixels rounded last frame
	
	x = _x;
	y = _y;

	//One of the functions that WaterParticles can do
	static Add = function( _other )
	{
	    x += _other.x;
	    y += _other.y;
	}
}


waterParticles = [];


v1 = new WaterPart(10,10);