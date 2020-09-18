//Changeable
activatedTime = 2000; //Number of secconds for the sun to reach the maximum position
normalTime = 4000; //Number of secconds for the sun to reach max normally
screenRatio = 0.75; //Max positon of the sun


//Do not chage
maxRatio = 100; //sets the range for maxRatio
ratio = 0; // Initial rate
rateA = maxRatio * 1/activatedTime; //Linear rate
rateN = maxRatio * 1/normalTime

x = room_width/2;
y = room_height;

startHeight = y;
finishHeight = y - room_height * screenRatio 

moveAmount = startHeight - finishHeight;