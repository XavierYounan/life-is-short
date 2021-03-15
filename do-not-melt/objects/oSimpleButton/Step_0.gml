switch (state) {
	case buttonState.unpressed:
	
		if((mouse_x >= bbox_left) && (mouse_x <= bbox_right)){
			if((mouse_y >= bbox_top) && (mouse_y <= bbox_bottom)){
				if(mouse_check_button_pressed(mb_left)){
					state = buttonState.pressed
				}else{
					state = buttonState.hover
				}
			}	
		}
	

		
        break;
		
	case buttonState.hover:
        draw_sprite(sprite,1,x,y)
        break;
	
	
	case buttonState.pressed:
		draw_sprite(sprite,2,x,y)
		break;
	
    default:
        debug_log("Button state not set, draw", ERROR_LEVEL.WARNING)	
        break;
}