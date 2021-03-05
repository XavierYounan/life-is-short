if(intensity >= 1){
	tri1Rot += 1 * tri1RotSpeed * rotSpeedModifier * tri1Boost;
	tri1Rot = tri1Rot >= 360 ? tri1Rot - 360 : tri1Rot;	
}

if(intensity >= 2){
	tri2Rot += 2* tri1RotSpeed * rotSpeedModifier * tri2Boost;
	tri2Rot = tri2Rot >= 360 ? tri2Rot - 360 : tri2Rot;	
}
if(intensity >= 2.5){
	tri3Rot += 3 * tri1RotSpeed * rotSpeedModifier * tri3Boost;
	tri3Rot = tri3Rot >= 360 ? tri3Rot - 360 : tri3Rot;
}
if(intensity >= 3){
	tri4Rot += 4 * tri1RotSpeed * rotSpeedModifier * tri4Boost;
	tri4Rot = tri4Rot >= 360 ? tri4Rot - 360 : tri4Rot;
}

//Boost