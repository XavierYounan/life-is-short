#region SETTIGNS
//Camera
depthMin = -1000
lookDistance = 100000
cameraWidth = 1000
cameraHeight = 563
 

//Paralax
//x
treesXSpeed = 0.25;
mountainXSpeed = 0.5;
sunXSpeed = 0.95;
sunXRatio = 0.25; //25 percent of the x width

//y
mountainYSpeed = 0.5;
treesYSpeed = 0.25;
mountainYTransform = 170;
treesYTransform = 300;
yStart = 544//oStart.x;

#endregion

#region CALCULATIONS
//Camera
//Enable the use of views
view_enabled = true;

//Get the resolution of the monitor
xMonitorResolution = display_get_width() * 0.75
yMonitorResolution = display_get_height() * 0.75

//Make view 0 visible
view_set_visible(0, true);

//ViewPort is the game windown
//Set the size of the game to the screen size
view_set_wport(0, xMonitorResolution);
view_set_hport(0, yMonitorResolution);
//Position the top right of the window at the top of the page
view_set_xport(0,0);
view_set_yport(0,0);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);

//Makes the application surface better quality
resolutionScale = 2
surface_resize(application_surface,view_wport[0] * resolutionScale,view_hport[0] * resolutionScale);

camera = camera_create();

var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
var pm = matrix_build_projection_ortho(cameraWidth,cameraHeight,0,lookDistance);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

player = noone;


//Paralax
//Get references
mountainLayer = layer_get_id("Mountains");
treesLayer = layer_get_id("Trees");
sunInst = instance_find(oSun,0);

//Confirm referneces
if(mountainLayer == -1 || treesLayer == -1 || sunInst == -1){
	debug_log("Could not find mountain or trees layer", ERROR_LEVEL.WARNING,self);
}

//Calcuate sun transform
sunXTransform = (sunXRatio - 0.50) * cameraWidth
#endregion