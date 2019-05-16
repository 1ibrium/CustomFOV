#ifndef UNITY_SPACE_TRANSFORMS_INCLUDED
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/SpaceTransforms.hlsl"
#endif
uniform float2 shader_m0011_wh;
float4 CustomFOV_W_ToScreen(float3 vertexWS)
{
	float4x4 oPMatrix = GetViewToHClipMatrix();
#ifdef CUSTOM_FOV_ON
	oPMatrix[0][0] = shader_m0011_wh.x;
	oPMatrix[1][1] = shader_m0011_wh.y;
#endif
	float4 vertex = mul(oPMatrix,mul(GetWorldToViewMatrix(), float4(vertexWS, 1.0)));
	return vertex;
}