
var hh = display_get_gui_height()
var ww = display_get_gui_width()

var hRatio = hh/oSunManager.baseH;
var wRatio = ww/oSunManager.baseW;

var ww = wRatio * baseWidth;
var hh = hRatio * baseHeight;

var xx = wRatio * baseX;
var yy = hRatio * baseY;

var barWidth = (ww * barPercent)/totalMelts;
var spacerWidth = (ww * spacerPercent)/(totalMelts-1);


//Create each bar element
for(var i=0;i<totalMelts;i++){
	/*
	var bar = barElements[i];
		
	bar.x = xx + i * (barWidth + spacerWidth);
	bar.y = yy;
	
	bar.barWidth = barWidth;
	bar.barHeight = hh;

	bar.hlth = clamp(totalLife - i * lifePerBar,0,lifePerBar);
	*/
	
	var xxx = xx + i * (barWidth + spacerWidth);
	var yyy = yy
	
	draw_rectangle(xxx,yyy,xxx + barWidth, yyy + hh,false)
	
}
