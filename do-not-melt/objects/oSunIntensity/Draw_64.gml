var hh = display_get_gui_height()
var ww = display_get_gui_width()

var wRatio = ww/oSunManager.baseW;
var hRatio = hh/oSunManager.baseH;

var xx = wRatio * baseX;
var yy = hRatio * baseY;

var xScale = wRatio * baseXScale;
var yScale = hRatio * baseYScale;

draw_sprite_ext(sSunIntensity,index,xx,yy,xScale,yScale,0,-1,1)
