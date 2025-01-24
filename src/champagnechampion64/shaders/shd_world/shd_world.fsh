varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying float v_fDistance;

uniform vec3 u_Color;

uniform vec3 u_LightDirection;
uniform vec3 u_FogColor;
uniform float u_FogDistance;
uniform float u_FogStrength;

void main() {
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.rgb *= u_Color;
    
    gl_FragColor.rgb *= clamp(dot(v_vNormal, u_LightDirection), 0.5, 1.0);
    
    gl_FragColor.rgb = mix(gl_FragColor.rgb, u_FogColor, min(v_fDistance / u_FogDistance, u_FogStrength));
}