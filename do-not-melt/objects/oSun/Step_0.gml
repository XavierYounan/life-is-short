var dt = global.dt_steady

if(keyboard_check(vk_space)){
	//Grow rate A
	if(timeA ==0){
		timeA = initalRate;	
	}else{
		timeA = timeA * (1 + rateGrowth * dt)
	}
}else{
	timeA = 0;	
}

var rateA = maxRatio * 1/timeA

ratio = min(ratio + rateN * dt, maxRatio) //Normal movement
ratio = min(ratio + rateA * dt, maxRatio) //Normal movement

y = startHeight - ratio * moveAmount;