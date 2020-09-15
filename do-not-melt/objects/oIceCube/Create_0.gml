hsp = 0; // pixels per seccond
vsp = 0; // Pixels per seccond

hMove = 0; //Pixels this frame
vMove = 0; //Pixels this frame

hMoveFrac = 0; // Pixels rounded last frame
vMoveFrac = 0;  // Pixels rounded last frame

walksp = 200; // Pixels per seccond
grv = 10; // Pixels per seccond
jump_speed = 440; // Pixels per seccond


//Eventaully add finite state machiene
playerState = 0

//shrink
initialSize = 32
size = initialSize;
deathSize = 5;

dissappearTime = 200 //200 secconds
shrinkRate = (initialSize-deathSize)/dissappearTime// pixels per seccond
sizeFrac = 0;

lastSize = 32;



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


