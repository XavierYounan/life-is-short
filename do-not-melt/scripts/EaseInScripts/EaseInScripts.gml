function BoostShrink(triangles){
	switch(triangles){
		case 1:
			TweenFire(sun,EaseInOutSine,0,true,0,1,"tri1Boost",global.sunBoostMax,1)
		break;
		case 2:
			TweenFire(sun,EaseInOutSine,0,true,0,1,"tri2Boost",global.sunBoostMax,1)
		break;
		case 3:
			TweenFire(sun,EaseInOutSine,0,true,0,1,"tri3Boost",global.sunBoostMax,1)
		break;
		case 4:
			TweenFire(sun,EaseInOutSine,0,true,0,1,"tri4Boost",global.sunBoostMax,1)
		break;
	}
	
}