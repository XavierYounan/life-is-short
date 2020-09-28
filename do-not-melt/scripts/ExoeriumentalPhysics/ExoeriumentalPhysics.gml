/*

// delta time is in microsecconds 1/1million
#region Init
#region Change
physicsFixedFPS = 60;
physicsMinFPS = 10;
#endregion
	
#region Dont change
#macro ONE_MILLION 1000000
accumulator = 0;
fixedTimestep = (1/physicsFixedFPS) * ONE_MILLION;
minTimestep = (1/physicsMinFPS) * ONE_MILLION;
	
function position(_x,_y) constructor{
	x = _x;
	y = _y;
}
	
previousPosition = new position(x,y);
currentPosition = new position(x,y);
renderPosition = new position(x,y);
#endregion
	
#endregion
	
	
	#region step
	var dt = delta_time; //Get dt
	
	if(dt > minTimestep){
		dt = minTimestep //if FPS is below 10 too many steps which will then make DT bigger
		//Give the system a chance to catch up at the cost of the jump height shrinking and the player laggning behind2
	}
	accumulator += dt;
	
	while (accumulator >= fixedTimestep){
		previousPosition = currentPosition;
		
		//Do physics on currentPosition
		
		accumulator -= fixedTimestep;
	}
	
	alpha = accumulator / fixedTimestep;
	renderPosition = currentPosition * alpha + previousPosition  * (1 - alpha);
	

    x = renderPosition.x;
	y = renderPosition.y
	#endregion
*/