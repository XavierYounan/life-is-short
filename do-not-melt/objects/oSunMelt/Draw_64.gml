var hh = display_get_gui_height()
var ww = display_get_gui_width()


draw_sprite_ext(sMeltBackground,0,x,y,xScale, yScale,0,-1,1)
draw_sprite_ext(sMeltBar,0,x,y - barWidth * (100-percent),percent * xScale,1,0,-1,1)