vsp += grv; //add gravity

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
var bbox_side = hMove>0 ? bbox_right : bbox_left;

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

//Sample left and right tiles if grounded to see if should move down
var grounded = (InFloor(tilemap,x,y+1) >= 0)
if(grounded){	
	var left = InFloor(tilemap,x-1,y+1)
	var right = InFloor(tilemap,x+1,y+1)
	
	var diff = right-left
	

}

