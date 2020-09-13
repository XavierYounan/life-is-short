

/*/// Process water particles into the ones visible on the screen
var length = array_length(waterParticles);

var camX = oCamera.x;
var camY = oCamera.y;
var widthBorder = oCamera.cameraWidth/2;
var heightBorder = oCamera.cameraHeight/2;

var left = camX - widthBorder;
var right = camX + widthBorder;
var top = camY - heightBorder;
var bottom = camY + heightBorder;

numVisibleParticles= 0;
for (var i = 0; i < length; i++) {
	
	var xx = waterParticles[i].x;
	var yy = waterParticles[i].y;
	
	//Ugly but faster than chaining
	if(xx >= left){
		if(xx <= right){
			if(yy >= top){
				if(yy <= bottom){
					visibleParticles[numVisibleParticles] = [xx,yy];
					numVisibleParticles++;
				}
			}
		}
	}
}
*/