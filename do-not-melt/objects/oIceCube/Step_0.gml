#region Pre fixedTimestep setup
//Temp Vars
var p1,p2,bbox_side;

//Get inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
//key_down = keyboard_check(vk_down);

//SHRINK
//Calcuate ratio
var curDissappearTime = initialDissappearTime - (initialDissappearTime-minDissapearTime) * oSun.ratio/100
var shrinkRate = (initialSize-deathSize)/curDissappearTime// pixels per seccond
size -= sizeFrac;//Re apply sizeFrac

#endregion

#region Physics Fixed Timestep
var dt = delta_time; //Get dt
	
if(dt > minTimestep){
	dt = minTimestep //if FPS is below 10 too many steps which will then make DT bigger
	//Give the system a chance to catch up at the cost of the jump height shrinking and the player laggning behind2
}
accumulator += dt;
	
while (accumulator >= fixedTimestep){
	previousPosition = currentPosition;
	accumulator -= fixedTimestep;

	#region Physics simulation
	
	#region Change oIceCube size
	sizeFrac = ceil(size) - size; // Find amount needed to round size up
	size += sizeFrac; //round size up

	if(size != lastSize){
		sizeRatio = size/initialSize;
		image_xscale = sizeRatio;
		image_yscale = sizeRatio;
		lastSize = size;
	
		//Check compatiable 

		//Check if not too small
		if(size < deathSize){
			instance_destroy(self);
			with(oStart){
				Respawn(camera);	
			}	
		}
	}
	*/
	#endregion
	
	//Move x and y and then write to currentPositon 
	#region movement
	move = (key_right - key_left) * walksp
	hsp = move;
	vsp += grv;

	var grounded = (InFloor(tilemap,x,bbox_bottom+1) >= 0) //Should it be >=?
	var left = InFloor(tilemap,bbox_left,bbox_bottom+1)
	var right = InFloor(tilemap,bbox_right,bbox_bottom+1)

	if(grounded || right >= 0 || left >= 0)
	{
		if(key_up)
		{
			vsp = -jump_speed;
			grounded = false;
		}
	}

	//Calculate number of pixels moved this frame
	hMove = hsp * fixedTimestepS;
	vMove = vsp * fixedTimestepS;


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
	bbox_side = hMove>0 ? bbox_right : bbox_left;

	var p1 = tilemap_get_at_pixel(tilemap,bbox_side+hMove,bbox_top);
	var p2 = tilemap_get_at_pixel(tilemap,bbox_side+hMove,bbox_bottom);

	if(tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1) p2 = 0; //if on a slope ignore collision

	if (p1 == 1) || (p2 == 1) //inside a tile with a collision
	{
		if (hMove > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
		else x = x - (x mod TILE_SIZE) - (bbox_left - x);
		hMove = 0;
		hsp = 0;
	}
	
	x += hMove ;
	
	

	//Vertical Collision
	if (vMove >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilemap_get_at_pixel(tilemap,x,bbox_side+vMove) <=1)
	{
		p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vMove) 
		p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vMove)
		if (p1 == 1) || (p2 == 1)
		{
			if (vMove >= 0){
				y = y - (y mod TILE_SIZE) - (bbox_bottom - y) + (TILE_SIZE-1)
			}else{
				y = y - (y mod TILE_SIZE) - (bbox_top - y);
			}
			vMove = 0;
			vsp = 0;
		}
	}

	y += vMove; 


	var floorDist = InFloor(tilemap,x,bbox_bottom)
	if (floorDist >= 0)
	{
		y -= floorDist + 1; 
		vsp = 0;
		floorDist = -1;
	}

	#region Walk down slope, bounce protection
	
	if(grounded)
	{
		if(abs(floorDist) < 10) //snap limit of 10 if greater then obv not moving onto next tile
		{
			y += abs(floorDist) - 1 //moves to base of tileset
		
		
			if((bbox_bottom mod TILE_SIZE) == TILE_SIZE-1) //if at base of current tile
			{
			
				//if the slope continues 
				var tmap = tilemap_get_at_pixel(tilemap,x,bbox_bottom + 1)
				if(tmap > 1)
				{
					//move there
					var dis = InFloor(tilemap,x,bbox_bottom+1);
					y += abs(dis)
				}
			
			}
		}
		
	}
	#endregion
	//Save x and y positions
	currentPosition.x = x;
	currentPosition.y = y;
	
	#endregion

	#region shrink
	//size -= fixedTimestepS * shrinkRate //Apply this frames shrink amount
	#endregion
	#endregion	
}
	
#region Prepare for rendering 
alpha = accumulator / fixedTimestep;
renderPosition.Lerp(previousPosition, currentPosition, alpha);
x = renderPosition.x;
y = renderPosition.y;

#endregion

#endregion

#region Normal Timestep (use global.dt_Steady)

#endregion