sun = instance_create_layer(x,y,"Sun",oSun)
sunUi = instance_create_layer(

//Changeable
normalTime = 4000; //Number of secconds for the sun to reach max normally
finishRatio = 0.95; //Max positon of the sun
startRatio = 0.1; //10 percent up the screen

timeDecay = 0.8 //time to reach top decay of 80 percent each seccond
initalRate = 500; //Secconds for the sun to reach max vel

//Do not chage
maxRatio = 100; //sets the range for maxRatio
ratio = 0; // Initial rate
rateN = maxRatio * 1/normalTime

timeA = 0;

viewWidth = oCamera.cameraWidth;
viewHeight = oCamera.cameraHeight;

startHeight = viewHeight * (1 - startRatio);
finishHeight = viewHeight * (1 - finishRatio);

moveAmount = startHeight - finishHeight;



sunXSpeed = 0.5;
//yStart = 544//oStart.x;
sunYSpeed = 0.5;
sunYTransform = 100;//Set by sun

		