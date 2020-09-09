
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
		if((u_xArray[i] = v_vTexcoord.x) && (u_yArray = v_vTexcoord.y)){
			water = 1;
			reference = i;
		}
	}
	
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);

	
	
	for(int i=0; i<u_arrayLength; i++){
		if(u_xArray[i] = v_vTexcoord.x){
			for(int j=0; j<u_arrayLength; j++){
				if(u_yArray[j] = v_vTexcoord.y{
					gl_FragColor = vec4(colour.rgb, texture2D(gm_BaseTexture,uv).a);
				}
			}
		}
	}
}
