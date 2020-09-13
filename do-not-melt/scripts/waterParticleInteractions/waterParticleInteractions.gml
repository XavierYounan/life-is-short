function WaterPart(_x, _y, _hsp, _vsp) constructor
{

	/*
		constants will not keep but rather change to referencees to the parent obect (maybe)
	*/
	grv = +10;
	hspDampening = 10 //ten pixels per seccond
	hspTransferRatio = 0.8 // this amount of energy goes into the colliding water molecule
	vspTransferRatio = 0.8
	

	parent = oWaterParticleMangaer;
	//Constructer sets x and y
	hsp = _hsp; // pixels per seccond
	vsp = _vsp; // Pixels per seccond

	hMove = 0; //Pixels this frame
	vMove = 0; //Pixels this frame

	hMoveFrac = 0; // Pixels rounded last frame
	vMoveFrac = 0;  // Pixels rounded last frame
	
	tilemap = parent.tilemap;
	
	x = _x;
	y = _y;

	//One of the functions that WaterParticles can do
	static Step = function(){
		vsp += grv; //add gravity
		hsp = hsp - sign(hsp) * global.dt_steady * hspDampening; //Decrease hsp

		//Calculate number of pixels moved this frame
		hMove = hsp * global.dt_steady;
		vMove = vsp * global.dt_steady;

		//Re apply fractions
		hMove += hMoveFrac;
		vMove += vMoveFrac;

		//Store and Remove fractions
		//Important: go into collision with whole integers ONLY!
		hMoveFrac = hMove - (floor(abs(hMove)) * sign(hMove));
		hMove -= hMoveFrac;

		vMoveFrac = vMove - (floor(abs(vMove)) * sign(vMove));
		vMove -= vMoveFrac;

		//Horisontal collision			
		if(tilemap_get_at_pixel(tilemap,x,y+1) > 1){
			var p1 = 0; //if on a slope ignore collision
		}else{
			var p1 = tilemap_get_at_pixel(tilemap,x+hMove,y);
		}

		if (p1 == 1) //inside a tile with a collision
		{
			if (hMove > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1);
			else x = x - (x mod TILE_SIZE);
			hMove = 0;
			hsp = 0;
		}
	
		x += hMove ;
		
		
		


		p1 = tilemap_get_at_pixel(tilemap,x,y+vMove) 	

		if (p1 == 1) 
		{
			if (vMove >= 0){
				y = y - (y mod TILE_SIZE) + (TILE_SIZE-1)
			}else{
				y = y - (y mod TILE_SIZE);
			}
			vMove = 0;
			vsp = 0;
		}
	
		y += vMove; 


		var floorDist = InFloorWater(tilemap,x,y)
		if (floorDist >= 0)
		{
			y -= floorDist +1; 
			vsp = 0;
			vMove = 0;
			floorDist = -1;
		}


		/*
			If water moves down slopes too fast then add a timer where will only do it so often
			If water moves to slow make it move down 2 at a time
			Potentiall check one/two/three pixels accross if gets stuck on some tiles
		*/

		//Sample left and right tiles if grounded to see if should move down
		var grounded = (InFloorWater(tilemap,x,y+1) >= 0)
		if(grounded){	
			var left = (InFloorWater(tilemap,x-1,y+1) < 0)
			var right = (InFloorWater(tilemap,x+1,y+1) < 0) // will return 1 if there is space there
	
			if(right && left){
				right = right - global.lastDir;
				left = global.lastDir;
				global.lastDir = 0 ? global.lastDir = 1: global.lastDir = 0;
			}
	
			if(right){ //right has priority if on a peak
				x +=1;
				hsp = 15
				y+=1;
			}else {
				if(left){
					var left = (InFloorWater(tilemap,x-1,y+1) < 0) 
					hsp = 15
					x-=1;
					y+=1; 
				}
			}
		}
		return;
	}
	
	/*
	static Collide = function(tilemap,x,y){	
		var length = array_length(parent.waterParticles);
		for(var i=0; i<length; i++){
			if((x == parent.waterParticles[i].x) && (y == parent.waterParticles[i].y)){
				return -1;
			}
		}
		return InFloor(tilemap,x,y);	
	}
	*/
	
	static InFloorWater = function(tilemap, x, y) {
		var tileIndex = tilemap_get_at_pixel(tilemap, x, y)
		if (tileIndex > 0) //if pixel is in a tile
		{
			if (tileIndex == 1) return (y mod TILE_SIZE); //solid tile
	
			var theFloor = global.heightsFromTop[(x mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
			return CheckWaterParticle((y mod TILE_SIZE) - theFloor,x,y);
		} 
		else return CheckWaterParticle( -(TILE_SIZE - (y mod TILE_SIZE)),x,y);
	}
	
	static CheckWaterParticle = function(response,x,y){
		var length = array_length(parent.waterParticles);
		for(var i=0; i<length; i++){
			if((x == parent.waterParticles[i].x) && (y == parent.waterParticles[i].y)){
				return -1;
			}
		}
		return response
	}
}
