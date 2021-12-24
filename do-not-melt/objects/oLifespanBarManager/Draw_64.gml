if(totalMelts > 0){
	var hh = display_get_gui_height()
	var ww = display_get_gui_width()

	var hRatio = hh/oSunManager.baseH;
	var wRatio = ww/oSunManager.baseW;

	var ww = wRatio * baseWidth;
	var hh = hRatio * baseHeight;

	var xx = wRatio * baseX;
	var yy = hRatio * baseY;
	
	var barWidth = (ww * barPercent)/totalMelts;
	var maxWidth = (ww * barPercent)/minNum;
	var barWidth = min(barWidth,maxWidth)

	var spacerWidth = (ww * spacerPercent)/(totalMelts-1);
	var maxWidth = (ww * spacerPercent)/(minNum-1);
	var spacerWidth = min(spacerWidth,maxWidth)
	
	var shear = hh/tan10
	
	totalLife = currentMelt * lifePerBar + currentPercent

	//Update each bar element
	for(var i=0;i<totalMelts;i++){
		var bar = barElements[i];
		bar.hlth = clamp(totalLife - (i+1) * lifePerBar,0,lifePerBar);
		
		bar.leftBottom = xx + i * (barWidth + spacerWidth)
		bar.leftTop = xx + shear + i * (barWidth + spacerWidth);
		
		bar.rightBottom = xx + barWidth * bar.hlth + i * (barWidth + spacerWidth)
		bar.rightTop = xx + barWidth * bar.hlth + shear * bar.hlth + i * (barWidth + spacerWidth)
		
		bar.top = yy;
		bar.bottom = yy + hh;
	}
}

draw_sprite_pos(sLifespanBar, 0, 100, 500, 200, 500, 50, 700, 150, 700, 1);