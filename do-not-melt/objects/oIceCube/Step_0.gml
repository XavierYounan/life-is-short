//Temp Vars
var p1,p2,bbox_side;

//Get inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
//key_down = keyboard_check(vk_down);

//shrink 
//Calcuate ratio
var curDissappearTime = initialDissappearTime - (initialDissappearTime-minDissapearTime) * oSun.ratio/100
var shrinkRate = (initialSize-deathSize)/curDissappearTime// pixels per seccond


size -= sizeFrac;//Re apply sizeFrac
size -= global.dt_steady * shrinkRate //Apply this frames shrink amount

//Find size ratio
sizeRatio = size/initialSize;
image_xscale = sizeRatio;
image_yscale = sizeRatio;

sizeFrac = ceil(size) - size; // Find amount needed to round size up
size += sizeFrac; //round size up

if(size != lastSize){
	
	lastSize = size;
	
	var xx = x;
	var yy = y;

	with(oWaterParticleManger){
		if(waterCells[xx][yy] = waterType.air){
			var ls = ds_list_create()
			ds_list_add(ls,xx,yy,0)
	
			waterCells[xx][yy] = ls;
			water[waterLength] = ls;
			waterLength++;
		} 
	}
	
	
	//Check if not too small
	if(size < deathSize){
		instance_destroy(self);
		with(oStart){
			Respawn(camera);	
		}	
	}
}

//Calculate Movement
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


