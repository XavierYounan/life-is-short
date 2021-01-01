var hh = display_get_gui_height()
var ww = display_get_gui_width()

var hRatio = hh/oSunManager.baseH;
var wRatio = ww/oSunManager.baseW;

var xx = wRatio * baseX;
var yy = hRatio * baseY;

var xScale = wRatio * baseXScale;
var yScale = hRatio * baseYScale;

var scaledXOrigin = barXOrigin * xScale;
var scaledYOrigin = barYOrigin * yScale;

draw_sprite_ext(sMeltBackground, 0, xx, yy, xScale, yScale,0,-1,1)
draw_sprite_ext(sMeltBar, 0, xx + scaledXOrigin * xScale, yy + scaledYOrigin , xScale * percent, yScale, 0, -1, 1)

