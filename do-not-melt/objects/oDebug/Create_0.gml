/// @description Initialise
#macro DEBUGGING false
#macro Debug:DEBUGGING true


//setup
if (!assert_singleton()) return;
errorColours = ds_map_create()

enum ERROR_LEVEL
{
	FATAL,
	ERROR,
	WARNING,
	INFO,
	DEBUG,
	SPAM
}


//Changeable

ds_map_add(errorColours, ERROR_LEVEL.FATAL, c_maroon)
ds_map_add(errorColours, ERROR_LEVEL.ERROR, c_red)
ds_map_add(errorColours, ERROR_LEVEL.WARNING, c_orange)
ds_map_add(errorColours, ERROR_LEVEL.INFO, c_white)
ds_map_add(errorColours, ERROR_LEVEL.DEBUG, c_blue)
ds_map_add(errorColours, ERROR_LEVEL.SPAM, c_gray)


display_level = ERROR_LEVEL.DEBUG

ySpacing = 60; 
bottomBorder = 60
//Dont change

spam_message = ds_map_create()
spam_message_que = ds_list_create()

m_maxMessages = 120;
m_messageList = ds_list_create();


#region Setup error catching
//If crash write error to error_file
error_file = "error.log";

if(!DEBUGGING){
	exception_unhandled_handler(function(ex){
	
	    if file_exists(error_file) file_delete(error_file);
	    var _f = file_text_open_write(error_file);
	    file_text_write_string(_f, string(ex));
	    file_text_close(_f);
		show_error(string(ex),true)
	    return 0;
	});

	error_text = "";

	if (file_exists(error_file)) {
	    var buf = buffer_load(error_file);
	    error_text = buffer_read(buf, buffer_string);
	    buffer_delete(buf);
	    file_delete(error_file);
		debug_log(error_text,ERROR_LEVEL.FATAL)
	}
}

#endregion

//Setup sentry
if(! sentry_init("https://acce9c79a94d44ad8aef6472da3c4b88@o254709.ingest.sentry.io/5434411") > 0)
{
	priv_console_add_message("sentry failed to initialise", ERROR_LEVEL.ERROR)
}

sentry_add_tag("Version", "sunAndMelting")

