//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int[50000] = u_xArray;
uniform int[50000] = u_yArray;


void main()
{
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	
	for(int i=0; i<50000; i++){
		if(u_xArray[i] == v_vTexcoord[0]){
			for(int j=0; j<50000; j++){
				if(u_yArray[j] == v_vTexcoord[1]){
					gl_FragColor = c_blue;
				}
			}
		}
	}
}
