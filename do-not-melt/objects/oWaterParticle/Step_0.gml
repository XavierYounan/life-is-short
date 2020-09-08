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
/*
//Check collision with other particles first
for(var i=1; i<hMove; i++){
	var instance = instance_place(x + i * sign(hMove),y,oWaterParticle)
	if(instance){
		x += (i-1) * sign(hMove);
		instance.hsp += hsp * hspTransferRatio;
		hsp *= 1-hspTransferRatio
		hMove = 0;
		break;
	}
}
*/


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
/*
//Check collision with other water particls first
for(var i=1; i<vMove; i++){
	var instance = instance_place(x ,y + i * sign(hMove) ,oWaterParticle)
	if(instance){
		if(instance.vsp != vsp){
		y += (i-1) * sign(vMove);
		instance.vsp += vsp * vspTransferRatio;
		vsp *= 1 * vspTransferRatio;
		vMove = 0;
		break;
		}
	}
}
*/


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


var floorDist = InFloorWaterPart(tilemap,x,bbox_bottom)
if (floorDist >= 0)
{
	y -= floorDist + 1; 
	vsp = 0;
	floorDist = -1;
}


/*
	If water moves down slopes too fast then add a timer where will only do it so often
	If water moves to slow make it move down 2 at a time
	Potentiall check one/two/three pixels accross if gets stuck on some tiles
*/

//Sample left and right tiles if grounded to see if should move down
var grounded = (InFloorWaterPart(tilemap,x,y+1) >= 0)
if(grounded){	
	var left = (InFloorWaterPart(tilemap,x-1,y+1) < 0)
	var right = (InFloorWaterPart(tilemap,x+1,y+1) < 0) // will return 1 if there is space there
	
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
			var left = (InFloorWaterPart(tilemap,x-1,y+1) < 0) 
			hsp = 15
			x-=1;
			y+=1; 
		}
	}
}

