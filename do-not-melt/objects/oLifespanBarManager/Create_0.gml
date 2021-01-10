baseX = 64;
baseY = 2660

baseWidth = 5731 - baseX;
baseHeight = 2891 - baseY;

spacerPercent = 0.1 //10 percent
barPercent = 1-spacerPercent

lifePerBar = 100;
currentBar = 100;


//Create each bar element
for(var i=0;i<totalMelts;i++){
	var bar = instance_create_layer(0,0,"UserInterface",oLifespanBar);	
	barElements[i] = bar
	
}


barSprite = sLifespanBar
spriteWidth = 1000;
spriteHeight = 1000;
