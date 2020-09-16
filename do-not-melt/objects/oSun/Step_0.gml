if(keyboard_check(vk_space)){
	ratio = min(ratio + rateA * global.dt_steady, maxRatio) //Faster movement
}


ratio = min(ratio + rateN * global.dt_steady, maxRatio) //Normal movement


y = startHeight - ratio * moveAmount;