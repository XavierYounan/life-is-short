var hh = display_get_gui_height()
var ww = display_get_gui_width()

var hRatio = hh/oSunManager.baseH;
var wRatio = ww/oSunManager.baseW;

var xx = wRatio * baseX;
var yy = hRatio * baseY;

var xScale = wRatio * baseXScale;
var yScale = hRatio * baseYScale;

var scaledBarGapX = innerBarGap * xScale;
var scaledBarGapY = innerBarGap * yScale;

var scaledWidth = spriteWidth * xScale;
var scaledHeight = spriteHeight * yScale;

draw_sprite_ext(sMeltBackground, 0, xx, yy, xScale, yScale,0,-1,1)
draw_rectangle_color(xx + scaledBarGapX, yy + scaledBarGapY, xx + scaledWidth * percent - scaledBarGapX, yy + scaledHeight - scaledBarGapY,healthbarBlue,healthbarBlue,healthbarBlue,healthbarBlue,false)
