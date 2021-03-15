switch (state) {
	
	case buttonState.unpressed:
        draw_sprite(sprite,0,x,y)
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