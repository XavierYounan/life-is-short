if (DEBUGGING)
{
	var yAnchor = view_hport[0] * oCamera.resolutionScale - bottomBorder; 
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_alpha(1)
	draw_set_font(fDebug)
	
	//Prep loop
	var listSize = ds_list_size(m_messageList) //Find list size
	var count = 0; //number of drawn mesages (so when fiters doenst leave a gap)
	 
	for(var i=listSize-1; i>= 0; i--){
		var struct = m_messageList[| i]; //Grab struct reference
		
		var level = struct.Level; //Process level
		if(struct.Level <= display_level)
		{
			//Draw and increment count
			var colour = errorColours[? level]
			var message = struct.Message;
			
			draw_set_color(colour);
			draw_text(10, yAnchor - count * ySpacing, message);
			count ++;
		}	
		
	}
	draw_set_font(fDefault)
}