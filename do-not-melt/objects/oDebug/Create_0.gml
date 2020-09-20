/// @description Initialise
if (!assert_singleton()) return;

enum ERROR_LEVEL
{
	FATAL,
	ERROR,
	WARNING,
	INFO,
	DEBUG,
	SPAM
}

enum ConsoleArray
{
	Message,
	Level
}


spam_message = ds_map_create()
spam_message_que = ds_list_create()

m_maxMessages = 120;
m_messageList = ds_list_create();

displayingText = false

display_level = ERROR_LEVEL.DEBUG


errorColours = ds_map_create()

ds_map_add(errorColours, ERROR_LEVEL.FATAL, c_maroon)
ds_map_add(errorColours, ERROR_LEVEL.ERROR, c_red)
ds_map_add(errorColours, ERROR_LEVEL.WARNING, c_orange)
ds_map_add(errorColours, ERROR_LEVEL.INFO, c_white)
ds_map_add(errorColours, ERROR_LEVEL.DEBUG, c_blue)
ds_map_add(errorColours, ERROR_LEVEL.SPAM, c_gray)



#region Setup error catching
//If crash write error to error_file
error_file = "misc/error.log";

exception_unhandled_handler(function(ex)
    {
    if file_exists(error_file) file_delete(error_file);
    var _f = file_text_open_write(error_file);
    file_text_write_string(_f, string(ex));
    file_text_close(_f);
    return 0;
    }
)

error_text = "";

if (file_exists(error_file)) {
    var buf = buffer_load(error_file);
    error_text = buffer_read(buf, buffer_string);
    buffer_delete(buf);
    file_delete(error_file);
}


#endregion




if(! sentry_init("https://acce9c79a94d44ad8aef6472da3c4b88@o254709.ingest.sentry.io/5434411") > 0)
{
	priv_console_add_message("sentry failed to initialise", ERROR_LEVEL.ERROR)
}

sentry_add_tag("Version", "sunAndMelting")

