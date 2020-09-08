//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/*
uniform int u_size;
uniform int[size] = u_xArray
uniform int[size] = u_xArray
*/

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
