function errorMessage(_message, _level) constructor
{
	Message = _message
	Level = _level
}


function show_debug() { //Adds string split functionalty to show_debug_message
	var _message = argument[0];

	for (var _i = 1; _i < argument_count; _i++)
	{
		_message = string_replace(_message, "{}", string(argument[_i]));	
	}

	show_debug_message(_message)
}

function debug_log() { //level 1 limits spam
	/// @function debug_log(message, level, variables, title, spam)
	/// @desc Handles a debug message based on its level
	/// @param {string} Message The message to display
	/// @param {integer} Debug_level The severity of the debug message
	/// @param {obejct_reference} variables the object should contain any variables wished to be recorded
	/// @param {string} title the title of a breadcrumb
	/// @param {integer} spam Pause time before same message is logged again
	var stack = debug_get_callstack() //preserves stack as much as possible whilst retaining automation

	var stack_string = ""
	for (var i = 0; i <array_length(stack) ; ++i) 
	{
	    stack_string += string(stack[i]);
	}


	if(!instance_exists(oDebug))
	{
		show_debug("Error logging: {}", string(stack_string));
		return;
	}

	//Unpack variables
	var message= argument[0]

	if (argument_count > 1) 
	{
		var level = argument[1]
	}
	else
	{
		level = ERROR_LEVEL.DEBUG
		message += " no level defined, set as DEBUG"
	}

	var variables = (argument_count > 2) ? argument[2] : undefined;
	var title = (argument_count > 3) ? argument[3] : undefined;
	var spamLimiter = (argument_count > 4) ? argument[4] : undefined;


	if (spamLimiter = undefined)
	{
		priv_debug_log(message, level, variables, stack_string, title)	
	}
	else
	{
		spamLimiter = spamLimiter * 1000 //convert to millisecconds

		with(oDebug)
		{
			//clear displayable messages
			var listSize = ds_list_size(spam_message_que)

			for(var i = 0; i < listSize; i++)
			{
				var message = spam_message_que[| i]
				var timeMessageExpires = spam_message[? message]
	
				if (current_time > timeMessageExpires) //message block is expired, remove block
				{
					ds_map_delete(spam_message,message)
					ds_list_delete(spam_message_que,i)
					i--
				}
			
				var listSize = ds_list_size(spam_message_que)
			}
		
			//if can display message
	
			var timeCanDisplay = spam_message[? message]
	
			if timeCanDisplay == undefined //message is able to be displayed
			{
				priv_debug_log(message, level, variables, stack_string, title)
				ds_map_add(spam_message,message,current_time + spamLimiter)	
				ds_list_add(spam_message_que,message)
			}
		}
	}




}

function priv_debug_log() { //Level 2  logs it to sentry and console when required
	var message = argument[0]
	var level = argument[1]
	var variables = argument[2]
	var stack = argument[3]
	var title = argument[4]


	switch (level)
	{
		case ERROR_LEVEL.FATAL:
		{
			sentry_capture_message(message, SENTRY_FATAL, stack, variables)
			priv_console_add_message(message, level)
			break;	
		}
	
		case ERROR_LEVEL.ERROR:
		{
			sentry_capture_message(message, SENTRY_ERROR, stack, variables)
			priv_console_add_message(message, level)
			break;	
		}
	
		case ERROR_LEVEL.WARNING:
		{
			sentry_capture_message(message, SENTRY_WARNING, stack, variables)
			priv_console_add_message(message, level)
			break;	
		}
	
		case ERROR_LEVEL.INFO:
		{
			sentry_add_breadcrumb(title , SENTRY_INFO, message)
			priv_console_add_message(message, level)
			break;	
		}
	
		case ERROR_LEVEL.DEBUG:
		{
			sentry_add_breadcrumb(title, SENTRY_DEBUG, message)
			priv_console_add_message(message, level)
			break;	
		}
	
		case ERROR_LEVEL.SPAM:
		{
			priv_console_add_message(message, level)
			break;	
		}
	}


}

function priv_console_add_message(_message, _level) { //level 3
	with(oDebug)
	{
		var struct = new errorMessage(_message,_level)
		ds_list_add(m_messageList,struct);
	
		if (ds_list_size(m_messageList) > m_maxMessages)
		{
			delete m_messageList[| 0];//delete struct
			ds_list_delete(m_messageList,0); //Clear position in array	
		}
	}


}
