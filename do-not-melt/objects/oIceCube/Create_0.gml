hsp = 0; // pixels per seccond
vsp = 0; // Pixels per seccond

hMove = 0; //Pixels this frame
vMove = 0; //Pixels this frame

hMoveFrac = 0; // Pixels rounded last frame
vMoveFrac = 0;  // Pixels rounded last frame

walksp = 200; // Pixels per seccond
grv = 10; // Pixels per seccond
jump_speed = 440; // Pixels per seccond

//shrink
/*
initialSize = 32
size = initialSize;
deathSize = 5;


meltBorder = 4;

minDissapearTime = 2 //2 secconds
initialDissappearTime = 30 //30 secco	nds

sizeFrac = 0;
lastSize = 32;
*/

// delta time is in microsecconds 1/1million
#region Init
#region Change
physicsFixedFPS = 60;
physicsMinFPS = 10;
#endregion
	
#region Dont change
#macro ONE_MILLION 1000000
accumulator = 0;
fixedTimestepS = 1/physicsFixedFPS
fixedTimestep = fixedTimestepS * ONE_MILLION;
minTimestep = (1/physicsMinFPS) * ONE_MILLION;
	
function position(_x,_y) constructor{
	x = _x;
	y = _y;
	
	static Lerp = function(_from, _to, _alpha){
		x = _from.x * (1-_alpha) + _to.x *  _alpha
		y = _from.y * (1-_alpha) + _to.y * 	_alpha
	}
}
	
previousPosition = new position(x,y);
currentPosition = new position(x,y	);
renderPosition = new position(x,y);
#endregion
	
#endregion
	


var all_layers = layer_get_all();

for (var i=0; i<array_length_1d(all_layers); i++) 
{
    var this_layer = all_layers[i];
    var all_elements = layer_get_all_elements(this_layer);

    for (var j=0; j<array_length_1d(all_elements); j++) 
	{
      var this_element = all_elements[j];
      if (layer_get_element_type(this_element) == layerelementtype_tilemap) 
	  {
        var tmap = this_element;
		if  (tilemap_get_tileset(tmap) == tsCollision)
		{
			tilemap = tmap	
			//show_debug_message("Collision Tilemap found!")
		}
    
        if(tmap == -1) 
		{
            //debug_log("Tilemap not found, tilemap: " + string(tmap) + " layerId: " + string(this_layer) + " layerName: " + layer_get_name(this_layer), ERROR_LEVEL.WARNING)
        }
      }
    }
}


