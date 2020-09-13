	/*
	varying vec2 v_vTexcoord;
	varying vec4 v_vColour;

	uniform int u_arrayLength;
	uniform int u_xArray[50000];
	uniform int u_yArray[50000];

	void main()
	{
		int water = 0;
		int reference = 0;
	
		for(int i=0; i<u_arrayLength; i++){
			if((u_xArray[i] == v_vTexcoord.x) && (u_yArray == v_vTexcoord.y)){
				water = 1;
				reference = i;
			}
		}
	
		if(water){
			gl_FragColor = vec4(0,191,255,0.8);
		}else{
			 gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
		}
	}
*/

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
