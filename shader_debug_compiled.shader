// Compiled shader for custom platforms

//////////////////////////////////////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
//
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _GlossMapScale ("Smoothness Scale", Range(0.000000,1.000000)) = 1.000000
[Enum(Metallic Alpha,0,Albedo Alpha,1)]  _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0.000000
[Gamma]  _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
[ToggleOff]  _SpecularHighlights ("Specular Highlights", Float) = 1.000000
[ToggleOff]  _GlossyReflections ("Glossy Reflections", Float) = 1.000000
 _BumpScale ("Scale", Float) = 1.000000
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005000,0.080000)) = 0.020000
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0.000000,1.000000)) = 1.000000
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1.000000
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
}
SubShader {
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = vs_TEXCOORD2.w;
        u_xlat18.y = vs_TEXCOORD3.w;
        u_xlat18.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_4.y * _OcclusionStrength + u_xlat42;
    u_xlat4.x = (-_Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = u_xlat2.xyz * (-u_xlat17.xxx) + u_xlat3.xyz;
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = vs_TEXCOORD2.w;
        u_xlat7.y = vs_TEXCOORD3.w;
        u_xlat7.z = vs_TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_6.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * vec3(u_xlat45);
            u_xlat9.x = vs_TEXCOORD2.w;
            u_xlat9.y = vs_TEXCOORD3.w;
            u_xlat9.z = vs_TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = u_xlat8.xyz * vec3(u_xlat45) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat17.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_8.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat10_8.xyz * vec3(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat44) * u_xlat10_6.xyz + (-u_xlat17.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat17.xyz;
    //ENDIF
    }
    u_xlat17.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat4.x + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat23;
float u_xlat32;
float u_xlat33;
float u_xlat34;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlatb48 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat19.xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat19.xyz;
        u_xlat19.xyz = u_xlat19.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = vs_TEXCOORD2.w;
        u_xlat20.y = vs_TEXCOORD3.w;
        u_xlat20.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19.x = u_xlat4.y * 0.25 + 0.75;
        u_xlat5.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat19.x = (-_OcclusionStrength) + 1.0;
    u_xlat19.x = u_xlat10_5.y * _OcclusionStrength + u_xlat19.x;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat49)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat4.xxx * _LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = vs_TEXCOORD2.w;
        u_xlat23.y = vs_TEXCOORD3.w;
        u_xlat23.z = vs_TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat10_8, u_xlat2);
        u_xlat8.y = dot(u_xlat10_9, u_xlat2);
        u_xlat8.z = dot(u_xlat10_7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(unity_SHAr, u_xlat2);
        u_xlat8.y = dot(unity_SHAg, u_xlat2);
        u_xlat8.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat7.xyz = u_xlat8.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = vs_TEXCOORD2.w;
        u_xlat9.y = vs_TEXCOORD3.w;
        u_xlat9.z = vs_TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_8.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlatb4 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = inversesqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = vs_TEXCOORD2.w;
            u_xlat11.y = vs_TEXCOORD3.w;
            u_xlat11.z = vs_TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * u_xlat4.xxx + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_5.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat48) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat8.xyz = vec3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), vec2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat34 + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = u_xlat7.xyz * u_xlat19.xxx + u_xlat3.xzw;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat23;
float u_xlat32;
float u_xlat33;
float u_xlat34;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlatb48 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat19.xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat19.xyz;
        u_xlat19.xyz = u_xlat19.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = vs_TEXCOORD2.w;
        u_xlat20.y = vs_TEXCOORD3.w;
        u_xlat20.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19.x = u_xlat4.y * 0.25 + 0.75;
        u_xlat5.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat19.x = (-_OcclusionStrength) + 1.0;
    u_xlat19.x = u_xlat10_5.y * _OcclusionStrength + u_xlat19.x;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat49)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat4.xxx * _LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = vs_TEXCOORD2.w;
        u_xlat23.y = vs_TEXCOORD3.w;
        u_xlat23.z = vs_TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat10_8, u_xlat2);
        u_xlat8.y = dot(u_xlat10_9, u_xlat2);
        u_xlat8.z = dot(u_xlat10_7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(unity_SHAr, u_xlat2);
        u_xlat8.y = dot(unity_SHAg, u_xlat2);
        u_xlat8.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat7.xyz = u_xlat8.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = vs_TEXCOORD2.w;
        u_xlat9.y = vs_TEXCOORD3.w;
        u_xlat9.z = vs_TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_8.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlatb4 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = inversesqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = vs_TEXCOORD2.w;
            u_xlat11.y = vs_TEXCOORD3.w;
            u_xlat11.z = vs_TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * u_xlat4.xxx + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_5.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat48) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat8.xyz = vec3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), vec2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat34 + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = u_xlat7.xyz * u_xlat19.xxx + u_xlat3.xzw;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION
-- Vertex shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = vs_TEXCOORD2.w;
        u_xlat18.y = vs_TEXCOORD3.w;
        u_xlat18.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_4.y * _OcclusionStrength + u_xlat42;
    u_xlat4.x = (-_Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = u_xlat2.xyz * (-u_xlat17.xxx) + u_xlat3.xyz;
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = vs_TEXCOORD2.w;
        u_xlat7.y = vs_TEXCOORD3.w;
        u_xlat7.z = vs_TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_6.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * vec3(u_xlat45);
            u_xlat9.x = vs_TEXCOORD2.w;
            u_xlat9.y = vs_TEXCOORD3.w;
            u_xlat9.z = vs_TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = u_xlat8.xyz * vec3(u_xlat45) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat17.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_8.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat10_8.xyz * vec3(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat44) * u_xlat10_6.xyz + (-u_xlat17.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat17.xyz;
    //ENDIF
    }
    u_xlat17.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat4.x + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = vs_TEXCOORD2.w;
        u_xlat18.y = vs_TEXCOORD3.w;
        u_xlat18.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_4.y * _OcclusionStrength + u_xlat42;
    u_xlat4.x = (-_Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = u_xlat2.xyz * (-u_xlat17.xxx) + u_xlat3.xyz;
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = vs_TEXCOORD2.w;
        u_xlat7.y = vs_TEXCOORD3.w;
        u_xlat7.z = vs_TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_6.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * vec3(u_xlat45);
            u_xlat9.x = vs_TEXCOORD2.w;
            u_xlat9.y = vs_TEXCOORD3.w;
            u_xlat9.z = vs_TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = u_xlat8.xyz * vec3(u_xlat45) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat17.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_8.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat10_8.xyz * vec3(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat44) * u_xlat10_6.xyz + (-u_xlat17.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat17.xyz;
    //ENDIF
    }
    u_xlat17.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat4.x + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat1);
    u_xlat3.y = dot(unity_SHBg, u_xlat1);
    u_xlat3.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat23;
float u_xlat32;
float u_xlat33;
float u_xlat34;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlatb48 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat19.xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat19.xyz;
        u_xlat19.xyz = u_xlat19.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = vs_TEXCOORD2.w;
        u_xlat20.y = vs_TEXCOORD3.w;
        u_xlat20.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19.x = u_xlat4.y * 0.25 + 0.75;
        u_xlat5.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat19.x = (-_OcclusionStrength) + 1.0;
    u_xlat19.x = u_xlat10_5.y * _OcclusionStrength + u_xlat19.x;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat49)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat4.xxx * _LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = vs_TEXCOORD2.w;
        u_xlat23.y = vs_TEXCOORD3.w;
        u_xlat23.z = vs_TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat10_8, u_xlat2);
        u_xlat8.y = dot(u_xlat10_9, u_xlat2);
        u_xlat8.z = dot(u_xlat10_7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(unity_SHAr, u_xlat2);
        u_xlat8.y = dot(unity_SHAg, u_xlat2);
        u_xlat8.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat7.xyz = u_xlat8.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = vs_TEXCOORD2.w;
        u_xlat9.y = vs_TEXCOORD3.w;
        u_xlat9.z = vs_TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_8.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlatb4 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = inversesqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = vs_TEXCOORD2.w;
            u_xlat11.y = vs_TEXCOORD3.w;
            u_xlat11.z = vs_TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * u_xlat4.xxx + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_5.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat48) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat8.xyz = vec3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), vec2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat34 + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = u_xlat7.xyz * u_xlat19.xxx + u_xlat3.xzw;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat1);
    u_xlat3.y = dot(unity_SHBg, u_xlat1);
    u_xlat3.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat23;
float u_xlat32;
float u_xlat33;
float u_xlat34;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlatb48 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat19.xyz;
        u_xlat19.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat19.xyz;
        u_xlat19.xyz = u_xlat19.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = vs_TEXCOORD2.w;
        u_xlat20.y = vs_TEXCOORD3.w;
        u_xlat20.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19.x = u_xlat4.y * 0.25 + 0.75;
        u_xlat5.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat19.x = (-_OcclusionStrength) + 1.0;
    u_xlat19.x = u_xlat10_5.y * _OcclusionStrength + u_xlat19.x;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat49)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat4.xxx * _LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = vs_TEXCOORD2.w;
        u_xlat23.y = vs_TEXCOORD3.w;
        u_xlat23.z = vs_TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat10_8, u_xlat2);
        u_xlat8.y = dot(u_xlat10_9, u_xlat2);
        u_xlat8.z = dot(u_xlat10_7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(unity_SHAr, u_xlat2);
        u_xlat8.y = dot(unity_SHAg, u_xlat2);
        u_xlat8.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat7.xyz = u_xlat8.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = vs_TEXCOORD2.w;
        u_xlat9.y = vs_TEXCOORD3.w;
        u_xlat9.z = vs_TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_8.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlatb4 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = inversesqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = vs_TEXCOORD2.w;
            u_xlat11.y = vs_TEXCOORD3.w;
            u_xlat11.z = vs_TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * u_xlat4.xxx + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_5.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat48) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat8.xyz = vec3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), vec2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat34 + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = u_xlat7.xyz * u_xlat19.xxx + u_xlat3.xzw;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat5;
    u_xlat3 = u_xlat1 * u_xlat2.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat4.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat5;
    u_xlat3 = u_xlat1 * u_xlat2.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat4.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = vs_TEXCOORD2.w;
        u_xlat18.y = vs_TEXCOORD3.w;
        u_xlat18.z = vs_TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_4.y * _OcclusionStrength + u_xlat42;
    u_xlat4.x = (-_Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = u_xlat2.xyz * (-u_xlat17.xxx) + u_xlat3.xyz;
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = vs_TEXCOORD2.w;
        u_xlat7.y = vs_TEXCOORD3.w;
        u_xlat7.z = vs_TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_6.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * vec3(u_xlat45);
            u_xlat9.x = vs_TEXCOORD2.w;
            u_xlat9.y = vs_TEXCOORD3.w;
            u_xlat9.z = vs_TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = u_xlat8.xyz * vec3(u_xlat45) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat17.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_8.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat10_8.xyz * vec3(u_xlat41);
        u_xlat6.xyz = vec3(u_xlat44) * u_xlat10_6.xyz + (-u_xlat17.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat17.xyz;
    //ENDIF
    }
    u_xlat17.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat4.x + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat22));
    u_xlat21 = u_xlat21 * u_xlat10_4.x;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat4.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat22, u_xlat23);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb22 = 0.0<u_xlat4.z;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat22 = u_xlat22 * u_xlat10_5.w;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat23));
    u_xlat22 = u_xlat22 * u_xlat10_4.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat22));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_22 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat21 = u_xlat21 * u_xlat16_22;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec2 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD6.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat5.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat22 = u_xlat22 * u_xlat10_4.w;
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
float u_xlat10_23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = unity_ShadowFadeCenterAndType.w * u_xlat22 + u_xlat21;
    u_xlat21 = u_xlat21 * _LightShadowData.z + _LightShadowData.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat5.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat5 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat5 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD5.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD5.zzzz + u_xlat5;
    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
    vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat10_23 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat24 = (-_LightShadowData.x) + 1.0;
    u_xlat23 = u_xlat10_23 * u_xlat24 + _LightShadowData.x;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = u_xlat21 * u_xlat22 + u_xlat23;
    u_xlatb22 = 0.0<u_xlat4.z;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat22 = u_xlat22 * u_xlat10_5.w;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat23));
    u_xlat22 = u_xlat22 * u_xlat10_4.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH SHADOWS_SOFT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
float u_xlat13;
float u_xlat14;
float u_xlat24;
float u_xlat25;
vec2 u_xlat28;
float u_xlat33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
float u_xlat10_35;
bool u_xlatb35;
float u_xlat36;
float u_xlat10_36;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat33 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * vs_TEXCOORD4.xyz;
    u_xlat33 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * vs_TEXCOORD1.xyz;
    u_xlat4 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat33 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = (-u_xlat33) + u_xlat34;
    u_xlat33 = unity_ShadowFadeCenterAndType.w * u_xlat34 + u_xlat33;
    u_xlat33 = u_xlat33 * _LightShadowData.z + _LightShadowData.w;
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlatb34 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb34){
        u_xlatb34 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb34)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat34 = u_xlat5.y * 0.25 + 0.75;
        u_xlat35 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat34, u_xlat35);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat34 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlatb35 = u_xlat33<0.99000001;
    if(u_xlatb35){
        u_xlat5 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
        u_xlat5 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD5.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD5.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_WorldToShadow[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat6.xy = u_xlat5.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat6.xy = floor(u_xlat6.xy);
        u_xlat5.xy = u_xlat5.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat6.xy);
        u_xlat7 = u_xlat5.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
        u_xlat8.xw = u_xlat7.xz * u_xlat7.xz;
        u_xlat28.xy = u_xlat8.xw * vec2(0.5, 0.5) + (-u_xlat5.xy);
        u_xlat7.xz = (-u_xlat5.xy) + vec2(1.0, 1.0);
        u_xlat9.xy = min(u_xlat5.xy, vec2(0.0, 0.0));
        u_xlat7.xz = (-u_xlat9.xy) * u_xlat9.xy + u_xlat7.xz;
        u_xlat5.xy = max(u_xlat5.xy, vec2(0.0, 0.0));
        u_xlat5.xy = (-u_xlat5.xy) * u_xlat5.xy + u_xlat7.yw;
        u_xlat9.x = u_xlat28.x;
        u_xlat9.y = u_xlat7.x;
        u_xlat9.z = u_xlat5.x;
        u_xlat9.w = u_xlat8.x;
        u_xlat9 = u_xlat9 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat8.x = u_xlat28.y;
        u_xlat8.y = u_xlat7.z;
        u_xlat8.z = u_xlat5.y;
        u_xlat7 = u_xlat8 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat8 = u_xlat9.ywyw + u_xlat9.xzxz;
        u_xlat10 = u_xlat7.yyww + u_xlat7.xxzz;
        u_xlat5.xy = u_xlat9.yw / u_xlat8.zw;
        u_xlat5.xy = u_xlat5.xy + vec2(-1.5, 0.5);
        u_xlat28.xy = u_xlat7.yw / u_xlat10.yw;
        u_xlat28.xy = u_xlat28.xy + vec2(-1.5, 0.5);
        u_xlat7.xy = u_xlat5.xy * _ShadowMapTexture_TexelSize.xx;
        u_xlat7.zw = u_xlat28.xy * _ShadowMapTexture_TexelSize.yy;
        u_xlat8 = u_xlat8 * u_xlat10;
        u_xlat9 = u_xlat6.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat7.xzyz;
        vec3 txVec0 = vec3(u_xlat9.xy,u_xlat5.z);
        u_xlat10_35 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        vec3 txVec1 = vec3(u_xlat9.zw,u_xlat5.z);
        u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat36 = u_xlat10_36 * u_xlat8.y;
        u_xlat35 = u_xlat8.x * u_xlat10_35 + u_xlat36;
        u_xlat6 = u_xlat6.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat7.xwyw;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat5.z);
        u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat35 = u_xlat8.z * u_xlat10_36 + u_xlat35;
        vec3 txVec3 = vec3(u_xlat6.zw,u_xlat5.z);
        u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat35 = u_xlat8.w * u_xlat10_36 + u_xlat35;
        u_xlat36 = (-_LightShadowData.x) + 1.0;
        u_xlat35 = u_xlat35 * u_xlat36 + _LightShadowData.x;
    } else {
        u_xlat35 = 1.0;
    //ENDIF
    }
    u_xlat34 = u_xlat34 + (-u_xlat35);
    u_xlat33 = u_xlat33 * u_xlat34 + u_xlat35;
    u_xlatb34 = 0.0<u_xlat4.z;
    u_xlat34 = u_xlatb34 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat34 = u_xlat34 * u_xlat10_5.w;
    u_xlat35 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat35));
    u_xlat34 = u_xlat34 * u_xlat10_4.x;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat5.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat33) * _LightColor0.xyz;
    u_xlat33 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat34) + (-u_xlat3.xyz);
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = max(u_xlat34, 0.00100000005);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat34 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat35 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat13 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat24 = u_xlat13 * u_xlat13;
    u_xlat24 = dot(vec2(u_xlat24), vec2(u_xlat33));
    u_xlat24 = u_xlat24 + -0.5;
    u_xlat3.x = (-u_xlat35) + 1.0;
    u_xlat14 = u_xlat3.x * u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat3.x = u_xlat3.x * u_xlat14;
    u_xlat3.x = u_xlat24 * u_xlat3.x + 1.0;
    u_xlat14 = -abs(u_xlat34) + 1.0;
    u_xlat25 = u_xlat14 * u_xlat14;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat14 = u_xlat14 * u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat14 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat3.x;
    u_xlat24 = u_xlat35 * u_xlat24;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat33 = max(u_xlat33, 0.00200000009);
    u_xlat3.x = (-u_xlat33) + 1.0;
    u_xlat14 = abs(u_xlat34) * u_xlat3.x + u_xlat33;
    u_xlat3.x = u_xlat35 * u_xlat3.x + u_xlat33;
    u_xlat34 = abs(u_xlat34) * u_xlat3.x;
    u_xlat34 = u_xlat35 * u_xlat14 + u_xlat34;
    u_xlat34 = u_xlat34 + 9.99999975e-06;
    u_xlat34 = 0.5 / u_xlat34;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat3.x = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat33 = u_xlat33 / u_xlat2.x;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat33 = u_xlat33 * 3.14159274;
    u_xlat33 = max(u_xlat33, 9.99999975e-05);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat35 * u_xlat33;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb34 = u_xlat34!=0.0;
    u_xlat34 = u_xlatb34 ? 1.0 : float(0.0);
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat2.xzw = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat33);
    u_xlat33 = (-u_xlat13) + 1.0;
    u_xlat34 = u_xlat33 * u_xlat33;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat4.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat23, u_xlat24);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat23 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_4.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_4.x;
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec2 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
float u_xlat14;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlatb2 = _UVSec==0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat2.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.w = 0.0;
    vs_TEXCOORD2 = u_xlat3.wwwx;
    vs_TEXCOORD3 = u_xlat3.wwwy;
    vs_TEXCOORD4.w = u_xlat3.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    vs_TEXCOORD4.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD6.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat1.zw;
    vs_TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
vec2 u_xlat18;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb23)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat5.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat23, u_xlat24);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat23 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat18.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat18.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_5.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_5.x;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat22 = u_xlat22 * u_xlat10_4.w;
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
float u_xlat10_23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = unity_ShadowFadeCenterAndType.w * u_xlat22 + u_xlat21;
    u_xlat21 = u_xlat21 * _LightShadowData.z + _LightShadowData.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat5.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
    u_xlat23 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat23 = max(abs(u_xlat5.z), u_xlat23);
    u_xlat23 = u_xlat23 + (-_LightProjectionParams.z);
    u_xlat23 = max(u_xlat23, 9.99999975e-06);
    u_xlat23 = u_xlat23 * _LightProjectionParams.w;
    u_xlat23 = _LightProjectionParams.y / u_xlat23;
    u_xlat23 = u_xlat23 + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat5.xyz,u_xlat23);
    u_xlat10_23 = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat24 = (-_LightShadowData.x) + 1.0;
    u_xlat23 = u_xlat10_23 * u_xlat24 + _LightShadowData.x;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = u_xlat21 * u_xlat22 + u_xlat23;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat22));
    u_xlat21 = u_xlat21 * u_xlat10_4.x;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE SHADOWS_SOFT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat11;
float u_xlat18;
float u_xlat19;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
float u_xlat27;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = (-u_xlat24) + u_xlat25;
    u_xlat24 = unity_ShadowFadeCenterAndType.w * u_xlat25 + u_xlat24;
    u_xlat24 = u_xlat24 * _LightShadowData.z + _LightShadowData.w;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat5.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat25, u_xlat26);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlatb26 = u_xlat24<0.99000001;
    if(u_xlatb26){
        u_xlat5.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
        u_xlat26 = max(abs(u_xlat5.y), abs(u_xlat5.x));
        u_xlat26 = max(abs(u_xlat5.z), u_xlat26);
        u_xlat26 = u_xlat26 + (-_LightProjectionParams.z);
        u_xlat26 = max(u_xlat26, 9.99999975e-06);
        u_xlat26 = u_xlat26 * _LightProjectionParams.w;
        u_xlat26 = _LightProjectionParams.y / u_xlat26;
        u_xlat26 = u_xlat26 + (-_LightProjectionParams.x);
        u_xlat6.xyz = u_xlat5.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
        vec4 txVec0 = vec4(u_xlat6.xyz,u_xlat26);
        u_xlat6.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
        vec4 txVec1 = vec4(u_xlat7.xyz,u_xlat26);
        u_xlat6.y = texture(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
        vec4 txVec2 = vec4(u_xlat7.xyz,u_xlat26);
        u_xlat6.z = texture(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
        vec4 txVec3 = vec4(u_xlat5.xyz,u_xlat26);
        u_xlat6.w = texture(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat26 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat27 = (-_LightShadowData.x) + 1.0;
        u_xlat26 = u_xlat26 * u_xlat27 + _LightShadowData.x;
    } else {
        u_xlat26 = 1.0;
    //ENDIF
    }
    u_xlat25 = u_xlat25 + (-u_xlat26);
    u_xlat24 = u_xlat24 * u_xlat25 + u_xlat26;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat25));
    u_xlat24 = u_xlat24 * u_xlat10_4.x;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat24 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat25) + (-u_xlat3.xyz);
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat4.xyz = vec3(u_xlat25) * u_xlat4.xyz;
    u_xlat25 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat26 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat10 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat18 = u_xlat10 * u_xlat10;
    u_xlat18 = dot(vec2(u_xlat18), vec2(u_xlat24));
    u_xlat18 = u_xlat18 + -0.5;
    u_xlat3.x = (-u_xlat26) + 1.0;
    u_xlat11 = u_xlat3.x * u_xlat3.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat3.x = u_xlat3.x * u_xlat11;
    u_xlat3.x = u_xlat18 * u_xlat3.x + 1.0;
    u_xlat11 = -abs(u_xlat25) + 1.0;
    u_xlat19 = u_xlat11 * u_xlat11;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat11 = u_xlat11 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat11 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat3.x;
    u_xlat18 = u_xlat26 * u_xlat18;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat3.x = (-u_xlat24) + 1.0;
    u_xlat11 = abs(u_xlat25) * u_xlat3.x + u_xlat24;
    u_xlat3.x = u_xlat26 * u_xlat3.x + u_xlat24;
    u_xlat25 = abs(u_xlat25) * u_xlat3.x;
    u_xlat25 = u_xlat26 * u_xlat11 + u_xlat25;
    u_xlat25 = u_xlat25 + 9.99999975e-06;
    u_xlat25 = 0.5 / u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat3.x = u_xlat2.x * u_xlat24 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat24 = u_xlat24 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat26 * u_xlat24;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb25 = u_xlat25!=0.0;
    u_xlat25 = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat2.xzw = vec3(u_xlat18) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat24 = (-u_xlat10) + 1.0;
    u_xlat25 = u_xlat24 * u_xlat24;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat24) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
float u_xlat10_23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = unity_ShadowFadeCenterAndType.w * u_xlat22 + u_xlat21;
    u_xlat21 = u_xlat21 * _LightShadowData.z + _LightShadowData.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat5.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
    u_xlat23 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat23 = max(abs(u_xlat5.z), u_xlat23);
    u_xlat23 = u_xlat23 + (-_LightProjectionParams.z);
    u_xlat23 = max(u_xlat23, 9.99999975e-06);
    u_xlat23 = u_xlat23 * _LightProjectionParams.w;
    u_xlat23 = _LightProjectionParams.y / u_xlat23;
    u_xlat23 = u_xlat23 + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat5.xyz,u_xlat23);
    u_xlat10_23 = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat24 = (-_LightShadowData.x) + 1.0;
    u_xlat23 = u_xlat10_23 * u_xlat24 + _LightShadowData.x;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = u_xlat21 * u_xlat22 + u_xlat23;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat22));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_22 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat21 = u_xlat21 * u_xlat16_22;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat21) * _LightColor0.xyz;
    u_xlat21 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + (-u_xlat3.xyz);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = abs(u_xlat22) * u_xlat3.x + u_xlat21;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat21;
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = u_xlat23 * u_xlat10 + u_xlat22;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = u_xlat2.x * u_xlat21 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE SHADOWS_SOFT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat11;
float u_xlat18;
float u_xlat19;
float u_xlat24;
float u_xlat25;
float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
float u_xlat27;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = (-u_xlat24) + u_xlat25;
    u_xlat24 = unity_ShadowFadeCenterAndType.w * u_xlat25 + u_xlat24;
    u_xlat24 = u_xlat24 * _LightShadowData.z + _LightShadowData.w;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat5.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat25, u_xlat26);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlatb26 = u_xlat24<0.99000001;
    if(u_xlatb26){
        u_xlat5.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
        u_xlat26 = max(abs(u_xlat5.y), abs(u_xlat5.x));
        u_xlat26 = max(abs(u_xlat5.z), u_xlat26);
        u_xlat26 = u_xlat26 + (-_LightProjectionParams.z);
        u_xlat26 = max(u_xlat26, 9.99999975e-06);
        u_xlat26 = u_xlat26 * _LightProjectionParams.w;
        u_xlat26 = _LightProjectionParams.y / u_xlat26;
        u_xlat26 = u_xlat26 + (-_LightProjectionParams.x);
        u_xlat6.xyz = u_xlat5.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
        vec4 txVec0 = vec4(u_xlat6.xyz,u_xlat26);
        u_xlat6.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
        vec4 txVec1 = vec4(u_xlat7.xyz,u_xlat26);
        u_xlat6.y = texture(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
        vec4 txVec2 = vec4(u_xlat7.xyz,u_xlat26);
        u_xlat6.z = texture(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
        vec4 txVec3 = vec4(u_xlat5.xyz,u_xlat26);
        u_xlat6.w = texture(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat26 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat27 = (-_LightShadowData.x) + 1.0;
        u_xlat26 = u_xlat26 * u_xlat27 + _LightShadowData.x;
    } else {
        u_xlat26 = 1.0;
    //ENDIF
    }
    u_xlat25 = u_xlat25 + (-u_xlat26);
    u_xlat24 = u_xlat24 * u_xlat25 + u_xlat26;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat25));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_25 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat24 = u_xlat24 * u_xlat16_25;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat4.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat24 = (-_Glossiness) + 1.0;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat25) + (-u_xlat3.xyz);
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat4.xyz = vec3(u_xlat25) * u_xlat4.xyz;
    u_xlat25 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat26 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat10 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat18 = u_xlat10 * u_xlat10;
    u_xlat18 = dot(vec2(u_xlat18), vec2(u_xlat24));
    u_xlat18 = u_xlat18 + -0.5;
    u_xlat3.x = (-u_xlat26) + 1.0;
    u_xlat11 = u_xlat3.x * u_xlat3.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat3.x = u_xlat3.x * u_xlat11;
    u_xlat3.x = u_xlat18 * u_xlat3.x + 1.0;
    u_xlat11 = -abs(u_xlat25) + 1.0;
    u_xlat19 = u_xlat11 * u_xlat11;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat11 = u_xlat11 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat11 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat3.x;
    u_xlat18 = u_xlat26 * u_xlat18;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat3.x = (-u_xlat24) + 1.0;
    u_xlat11 = abs(u_xlat25) * u_xlat3.x + u_xlat24;
    u_xlat3.x = u_xlat26 * u_xlat3.x + u_xlat24;
    u_xlat25 = abs(u_xlat25) * u_xlat3.x;
    u_xlat25 = u_xlat26 * u_xlat11 + u_xlat25;
    u_xlat25 = u_xlat25 + 9.99999975e-06;
    u_xlat25 = 0.5 / u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat3.x = u_xlat2.x * u_xlat24 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat24 = u_xlat24 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat26 * u_xlat24;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb25 = u_xlat25!=0.0;
    u_xlat25 = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat2.xzw = vec3(u_xlat18) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat24 = (-u_xlat10) + 1.0;
    u_xlat25 = u_xlat24 * u_xlat24;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat24) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="DEFERRED" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    SV_Target0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat1.xyz = _Color.xyz * u_xlat10_1.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat1.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target1.w = _Glossiness;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    SV_Target2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_2.y * _OcclusionStrength + u_xlat2.x;
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = vs_TEXCOORD2.w;
        u_xlat8.y = vs_TEXCOORD3.w;
        u_xlat8.z = vs_TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat1);
        u_xlat3.y = dot(u_xlat10_4, u_xlat1);
        u_xlat3.z = dot(u_xlat10_2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat1);
        u_xlat3.y = dot(unity_SHAg, u_xlat1);
        u_xlat3.z = dot(unity_SHAb, u_xlat1);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat10_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat3.xyz;
    SV_Target3.xyz = exp2((-u_xlat2.xyz));
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_2.y * _OcclusionStrength + u_xlat2.x;
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = vs_TEXCOORD2.w;
        u_xlat8.y = vs_TEXCOORD3.w;
        u_xlat8.z = vs_TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat1);
        u_xlat3.y = dot(u_xlat10_4, u_xlat1);
        u_xlat3.z = dot(u_xlat10_2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat1);
        u_xlat3.y = dot(unity_SHAg, u_xlat1);
        u_xlat3.z = dot(unity_SHAb, u_xlat1);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target3.xyz = exp2((-u_xlat2.xyz));
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH _EMISSION UNITY_HDR_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_2.y * _OcclusionStrength + u_xlat2.x;
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = vs_TEXCOORD2.w;
        u_xlat8.y = vs_TEXCOORD3.w;
        u_xlat8.z = vs_TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat1);
        u_xlat3.y = dot(u_xlat10_4, u_xlat1);
        u_xlat3.z = dot(u_xlat10_2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat1);
        u_xlat3.y = dot(unity_SHAg, u_xlat1);
        u_xlat3.z = dot(unity_SHAb, u_xlat1);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat10_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat3.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH UNITY_HDR_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10_2 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_2.y * _OcclusionStrength + u_xlat2.x;
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = vs_TEXCOORD2.w;
        u_xlat8.y = vs_TEXCOORD3.w;
        u_xlat8.z = vs_TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat1);
        u_xlat3.y = dot(u_xlat10_4, u_xlat1);
        u_xlat3.z = dot(u_xlat10_2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat1);
        u_xlat3.y = dot(unity_SHAg, u_xlat1);
        u_xlat3.z = dot(unity_SHAb, u_xlat1);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    SV_Target0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat1.xyz = _Color.xyz * u_xlat10_1.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat1.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target1.w = _Glossiness;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    SV_Target2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    u_xlat10_0 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _EmissionColor.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
SubShader {
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat9;
float u_xlat16_9;
vec3 u_xlat11;
float u_xlat21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat22 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * vs_TEXCOORD4.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = vs_TEXCOORD2.w;
        u_xlat11.y = vs_TEXCOORD3.w;
        u_xlat11.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat3.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat23 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat23)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat22 = u_xlat22 * u_xlat4.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat22);
    u_xlat16_22 = u_xlat10_6.w + -1.0;
    u_xlat22 = unity_SpecCube0_HDR.w * u_xlat16_22 + 1.0;
    u_xlat22 = u_xlat22 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_6.xyz * vec3(u_xlat22);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat22 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat6.zw = u_xlat6.xy * u_xlat6.xy;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xw;
    u_xlat4.yz = u_xlat6.zy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + 1.0;
    u_xlat22 = u_xlat22 + _Glossiness;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_9 = u_xlat10_6.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat4.xyw = (-u_xlat0.xyz) + vec3(u_xlat22);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat10;
vec3 u_xlat12;
float u_xlat24;
float u_xlat25;
float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * vs_TEXCOORD4.xyz;
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = vs_TEXCOORD2.w;
        u_xlat12.y = vs_TEXCOORD3.w;
        u_xlat12.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat3.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat26 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat26 = u_xlat26 + u_xlat26;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat26)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat25 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat25 = u_xlat25 * u_xlat4.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat25);
    u_xlat16_25 = u_xlat10_7.w + -1.0;
    u_xlat25 = unity_SpecCube0_HDR.w * u_xlat16_25 + 1.0;
    u_xlat25 = u_xlat25 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_7.xyz * vec3(u_xlat25);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat25 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat26)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat7.x = dot(u_xlat7.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat7.zw = u_xlat7.xy * u_xlat7.xy;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xw;
    u_xlat4.yz = u_xlat7.zy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 + _Glossiness;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat10_7 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_25 = u_xlat10_7.x * 16.0;
    u_xlat10.xyz = vec3(u_xlat16_25) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat4.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + vec3(u_xlat24);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat10;
vec3 u_xlat12;
float u_xlat24;
float u_xlat25;
float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * vs_TEXCOORD4.xyz;
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = vs_TEXCOORD2.w;
        u_xlat12.y = vs_TEXCOORD3.w;
        u_xlat12.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat3.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat26 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat26 = u_xlat26 + u_xlat26;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat26)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat25 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat25 = u_xlat25 * u_xlat4.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat25);
    u_xlat16_25 = u_xlat10_7.w + -1.0;
    u_xlat25 = unity_SpecCube0_HDR.w * u_xlat16_25 + 1.0;
    u_xlat25 = u_xlat25 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_7.xyz * vec3(u_xlat25);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat25 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat26)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat7.x = dot(u_xlat7.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat7.zw = u_xlat7.xy * u_xlat7.xy;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xw;
    u_xlat4.yz = u_xlat7.zy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 + _Glossiness;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat10_7 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_25 = u_xlat10_7.x * 16.0;
    u_xlat10.xyz = vec3(u_xlat16_25) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat4.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + vec3(u_xlat24);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10.xyz * u_xlat4.xyw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION
-- Vertex shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat9;
float u_xlat16_9;
vec3 u_xlat11;
float u_xlat21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat22 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * vs_TEXCOORD4.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = vs_TEXCOORD2.w;
        u_xlat11.y = vs_TEXCOORD3.w;
        u_xlat11.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat3.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat23 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat23)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat22 = u_xlat22 * u_xlat4.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat22);
    u_xlat16_22 = u_xlat10_6.w + -1.0;
    u_xlat22 = unity_SpecCube0_HDR.w * u_xlat16_22 + 1.0;
    u_xlat22 = u_xlat22 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_6.xyz * vec3(u_xlat22);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat22 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat6.zw = u_xlat6.xy * u_xlat6.xy;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xw;
    u_xlat4.yz = u_xlat6.zy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + 1.0;
    u_xlat22 = u_xlat22 + _Glossiness;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_9 = u_xlat10_6.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat4.xyw = (-u_xlat0.xyz) + vec3(u_xlat22);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat9;
float u_xlat16_9;
vec3 u_xlat11;
float u_xlat21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat22 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * vs_TEXCOORD4.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = vs_TEXCOORD2.w;
        u_xlat11.y = vs_TEXCOORD3.w;
        u_xlat11.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat3.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat23 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat23)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat22 = u_xlat22 * u_xlat4.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat22);
    u_xlat16_22 = u_xlat10_6.w + -1.0;
    u_xlat22 = unity_SpecCube0_HDR.w * u_xlat16_22 + 1.0;
    u_xlat22 = u_xlat22 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_6.xyz * vec3(u_xlat22);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat22 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat6.zw = u_xlat6.xy * u_xlat6.xy;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xw;
    u_xlat4.yz = u_xlat6.zy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + 1.0;
    u_xlat22 = u_xlat22 + _Glossiness;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_9 = u_xlat10_6.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat4.xyw = (-u_xlat0.xyz) + vec3(u_xlat22);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    vs_TEXCOORD1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat10;
vec3 u_xlat12;
float u_xlat24;
float u_xlat25;
float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * vs_TEXCOORD4.xyz;
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = vs_TEXCOORD2.w;
        u_xlat12.y = vs_TEXCOORD3.w;
        u_xlat12.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat3.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat26 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat26 = u_xlat26 + u_xlat26;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat26)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat25 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat25 = u_xlat25 * u_xlat4.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat25);
    u_xlat16_25 = u_xlat10_7.w + -1.0;
    u_xlat25 = unity_SpecCube0_HDR.w * u_xlat16_25 + 1.0;
    u_xlat25 = u_xlat25 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_7.xyz * vec3(u_xlat25);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat25 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat26)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat7.x = dot(u_xlat7.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat7.zw = u_xlat7.xy * u_xlat7.xy;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xw;
    u_xlat4.yz = u_xlat7.zy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 + _Glossiness;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat10_7 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_25 = u_xlat10_7.x * 16.0;
    u_xlat10.xyz = vec3(u_xlat16_25) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat4.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + vec3(u_xlat24);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    vs_TEXCOORD1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat10;
vec3 u_xlat12;
float u_xlat24;
float u_xlat25;
float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat24 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * vs_TEXCOORD4.xyz;
    u_xlatb25 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = vs_TEXCOORD2.w;
        u_xlat12.y = vs_TEXCOORD3.w;
        u_xlat12.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat25 = u_xlat3.y * 0.25 + 0.75;
        u_xlat26 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat25 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat26 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat26 = u_xlat26 + u_xlat26;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat26)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat25 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat25 = u_xlat25 * u_xlat4.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat25);
    u_xlat16_25 = u_xlat10_7.w + -1.0;
    u_xlat25 = unity_SpecCube0_HDR.w * u_xlat16_25 + 1.0;
    u_xlat25 = u_xlat25 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_7.xyz * vec3(u_xlat25);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat25 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = u_xlat2.xyz * (-vec3(u_xlat26)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat7.x = dot(u_xlat7.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat7.zw = u_xlat7.xy * u_xlat7.xy;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xw;
    u_xlat4.yz = u_xlat7.zy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 + _Glossiness;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat10_7 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_25 = u_xlat10_7.x * 16.0;
    u_xlat10.xyz = vec3(u_xlat16_25) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat4.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + vec3(u_xlat24);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10.xyz * u_xlat4.xyw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD4.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat28;
float u_xlat29;
float u_xlat39;
float u_xlat40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
float u_xlat16_44;
float u_xlat45;
bool u_xlatb45;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat39 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = unity_ShadowFadeCenterAndType.w * u_xlat42 + u_xlat41;
    u_xlat41 = u_xlat41 * _LightShadowData.z + _LightShadowData.w;
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlatb42 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat5.y * 0.25 + 0.75;
        u_xlat43 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat42 = u_xlat42 + (-u_xlat10_5.x);
    u_xlat41 = u_xlat41 * u_xlat42 + u_xlat10_5.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat43 = (-_Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat5.xxx) + u_xlat3.xyz;
    u_xlat6.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            u_xlat8.x = (u_xlatb10.x) ? hlslcc_movcTemp.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? hlslcc_movcTemp.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? hlslcc_movcTemp.z : u_xlat9.z;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat41) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat43) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat41);
    u_xlat16_44 = u_xlat10_7.w + -1.0;
    u_xlat44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat44 = u_xlat44 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat44);
    u_xlatb45 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = inversesqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
                u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
                u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat45) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_9 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat41);
        u_xlat16_41 = u_xlat10_9.w + -1.0;
        u_xlat41 = unity_SpecCube1_HDR.w * u_xlat16_41 + 1.0;
        u_xlat41 = u_xlat41 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_9.xyz * vec3(u_xlat41);
        u_xlat5.xyz = vec3(u_xlat44) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat15.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(vec2(u_xlat28), vec2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = u_xlat28 * u_xlat3.x + 1.0;
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat16 + 1.0;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = abs(u_xlat40) * u_xlat29 + u_xlat3.x;
    u_xlat29 = u_xlat41 * u_xlat29 + u_xlat3.x;
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = u_xlat41 * u_xlat42 + u_xlat40;
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = u_xlat2.x * u_xlat29 + (-u_xlat2.x);
    u_xlat2.x = u_xlat42 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 9.99999975e-05);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat43 + 1.0;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 + _Glossiness;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat15.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat5;
    u_xlat3 = u_xlat1 * u_xlat2.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat4.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat5;
    u_xlat3 = u_xlat1 * u_xlat2.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat4.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat10_8;
vec3 u_xlat9;
vec4 u_xlat10_9;
vec3 u_xlat10;
vec4 u_xlat10_10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
bvec3 u_xlatb14;
vec3 u_xlat17;
float u_xlat18;
vec3 u_xlat20;
float u_xlat32;
float u_xlat33;
float u_xlat35;
float u_xlat45;
float u_xlat46;
float u_xlat47;
float u_xlat16_47;
bool u_xlatb47;
float u_xlat48;
float u_xlat16_48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat45 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyz = vec3(u_xlat46) * vs_TEXCOORD4.xyz;
    u_xlat46 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * vs_TEXCOORD1.xyz;
    u_xlat4.x = vs_TEXCOORD2.w;
    u_xlat4.y = vs_TEXCOORD3.w;
    u_xlat4.z = vs_TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = unity_ShadowFadeCenterAndType.w * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 * _LightShadowData.z + _LightShadowData.w;
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
    u_xlatb49 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat20.xyz;
        u_xlat20.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat20.xyz;
        u_xlat20.xyz = u_xlat20.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20.x = u_xlat5.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat20.xy);
    u_xlat5.x = u_xlat5.x + (-u_xlat10_6.x);
    u_xlat48 = u_xlat48 * u_xlat5.x + u_xlat10_6.x;
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat5.x = (-_OcclusionStrength) + 1.0;
    u_xlat5.x = u_xlat10_5.y * _OcclusionStrength + u_xlat5.x;
    u_xlat20.x = (-_Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat35)) + u_xlat3.xyz;
    u_xlat7.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat8.yzw = u_xlat8.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat10_9 = texture(unity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_10 = texture(unity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat10_9, u_xlat2);
        u_xlat9.y = dot(u_xlat10_10, u_xlat2);
        u_xlat9.z = dot(u_xlat10_8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(unity_SHAr, u_xlat2);
        u_xlat9.y = dot(unity_SHAg, u_xlat2);
        u_xlat9.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat8.xyz = u_xlat9.xyz + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat9.xyz = vec3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            u_xlat10.x = (u_xlatb12.x) ? hlslcc_movcTemp.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? hlslcc_movcTemp.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? hlslcc_movcTemp.z : u_xlat11.z;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat10.xyz;
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    //ENDIF
    }
    u_xlat47 = (-u_xlat20.x) * 0.699999988 + 1.70000005;
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat10_9 = textureLod(unity_SpecCube0, u_xlat9.xyz, u_xlat47);
    u_xlat16_48 = u_xlat10_9.w + -1.0;
    u_xlat48 = unity_SpecCube0_HDR.w * u_xlat16_48 + 1.0;
    u_xlat48 = u_xlat48 * unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat10_9.xyz * vec3(u_xlat48);
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat11.xyz = vec3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat11.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat12;
                u_xlat12.x = (u_xlatb14.x) ? hlslcc_movcTemp.x : u_xlat13.x;
                u_xlat12.y = (u_xlatb14.y) ? hlslcc_movcTemp.y : u_xlat13.y;
                u_xlat12.z = (u_xlatb14.z) ? hlslcc_movcTemp.z : u_xlat13.z;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat49) + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat47);
        u_xlat16_47 = u_xlat10_4.w + -1.0;
        u_xlat47 = unity_SpecCube1_HDR.w * u_xlat16_47 + 1.0;
        u_xlat47 = u_xlat47 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat48) * u_xlat10_9.xyz + (-u_xlat4.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat46) + _WorldSpaceLightPos0.xyz;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat6.xyz = vec3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat17.x = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(vec2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = u_xlat32 * u_xlat3.x + 1.0;
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = u_xlat32 * u_xlat18 + 1.0;
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = abs(u_xlat46) * u_xlat33 + u_xlat3.x;
    u_xlat33 = u_xlat47 * u_xlat33 + u_xlat3.x;
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = u_xlat47 * u_xlat48 + u_xlat46;
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = u_xlat2.x * u_xlat33 + (-u_xlat2.x);
    u_xlat2.x = u_xlat48 * u_xlat2.x + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 9.99999975e-05);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat2.x = u_xlat3.x * 0.280000001;
    u_xlat2.x = (-u_xlat2.x) * u_xlat20.x + 1.0;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat45 + _Glossiness;
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlat3.xzw = vec3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = u_xlat8.xyz * u_xlat5.xxx + u_xlat3.xzw;
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat46) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xzw + u_xlat17.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + vec3(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xzw + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    vs_TEXCOORD2 = u_xlat0.wwwx;
    vs_TEXCOORD3 = u_xlat0.wwwy;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _EmissionColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2D _EmissionMap;
uniform  samplerCube unity_SpecCube0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat9;
float u_xlat16_9;
vec3 u_xlat11;
float u_xlat21;
float u_xlat22;
float u_xlat16_22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat22 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * vs_TEXCOORD4.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD3.www * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = vs_TEXCOORD2.w;
        u_xlat11.y = vs_TEXCOORD3.w;
        u_xlat11.z = vs_TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat3.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat23 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat3.xzw = u_xlat2.xyz * (-vec3(u_xlat23)) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-u_xlat4.x) * 0.699999988 + 1.70000005;
    u_xlat22 = u_xlat22 * u_xlat4.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat3.xzw, u_xlat22);
    u_xlat16_22 = u_xlat10_6.w + -1.0;
    u_xlat22 = unity_SpecCube0_HDR.w * u_xlat16_22 + 1.0;
    u_xlat22 = u_xlat22 * unity_SpecCube0_HDR.x;
    u_xlat3.xzw = u_xlat10_6.xyz * vec3(u_xlat22);
    u_xlat3.xyz = u_xlat10_3.yyy * u_xlat3.xzw;
    u_xlat22 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = u_xlat2.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat6.zw = u_xlat6.xy * u_xlat6.xy;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xw;
    u_xlat4.yz = u_xlat6.zy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + 1.0;
    u_xlat22 = u_xlat22 + _Glossiness;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat4.yw);
    u_xlat16_9 = u_xlat10_6.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat4.xyw = (-u_xlat0.xyz) + vec3(u_xlat22);
    u_xlat0.xyz = u_xlat4.zzz * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissionMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat18 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat19 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat19 = u_xlat19 * u_xlat10_3.x;
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD1.xyz);
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-_Glossiness) + 1.0;
    u_xlat10_2 = texture(unity_NHxRoughness, u_xlat2.xy);
    u_xlat16_2 = u_xlat10_2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat18 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat19 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * vs_TEXCOORD4.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : vs_TEXCOORD5.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat3.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat19, u_xlat20);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD1.xyz);
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-_Glossiness) + 1.0;
    u_xlat10_2 = texture(unity_NHxRoughness, u_xlat2.xy);
    u_xlat16_2 = u_xlat10_2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat18 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat19 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * vs_TEXCOORD4.xyz;
    u_xlat3 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = 0.0<u_xlat3.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat4.xy = u_xlat3.xy / u_xlat3.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat20 = u_xlat20 * u_xlat10_4.w;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat3.xx);
    u_xlat20 = u_xlat20 * u_xlat10_3.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD1.xyz);
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-_Glossiness) + 1.0;
    u_xlat10_2 = texture(unity_NHxRoughness, u_xlat2.xy);
    u_xlat16_2 = u_xlat10_2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat18 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat19 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat20));
    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xyz);
    u_xlat16_20 = u_xlat10_3.w * u_xlat10_4.x;
    u_xlat19 = u_xlat19 * u_xlat16_20;
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD1.xyz);
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-_Glossiness) + 1.0;
    u_xlat10_2 = texture(unity_NHxRoughness, u_xlat2.xy);
    u_xlat16_2 = u_xlat10_2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec2 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD6.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat18 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat19 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * vs_TEXCOORD4.xyz;
    u_xlat3.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
    u_xlat19 = u_xlat19 * u_xlat10_3.w;
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot((-vs_TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD1.xyz);
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-_Glossiness) + 1.0;
    u_xlat10_2 = texture(unity_NHxRoughness, u_xlat2.xy);
    u_xlat16_2 = u_xlat10_2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
float u_xlat10_3;
float u_xlat6;
float u_xlat9;
float u_xlat16_9;
bool u_xlatb9;
void main()
{
    u_xlat0 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb9 = 0.0<u_xlat0.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat0.xx);
    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_1.w * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.x * u_xlat0.x;
    u_xlat1 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD5.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD5.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_3 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat6 = (-_LightShadowData.x) + 1.0;
    u_xlat3.x = u_xlat10_3 * u_xlat6 + _LightShadowData.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD4.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat1.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.x * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    vs_TEXCOORD2 = u_xlat2.wwwx;
    vs_TEXCOORD3 = u_xlat2.wwwy;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat4.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat23, u_xlat24);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat23 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_4.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_4.x;
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec2 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
float u_xlat14;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlatb2 = _UVSec==0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat2.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.w = 0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.w = 0.0;
    vs_TEXCOORD2 = u_xlat3.wwwx;
    vs_TEXCOORD3 = u_xlat3.wwwy;
    vs_TEXCOORD4.w = u_xlat3.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    vs_TEXCOORD4.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD6.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat1.zw;
    vs_TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat10;
float u_xlat16;
float u_xlat17;
vec2 u_xlat18;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat21 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD4.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat4.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = vs_TEXCOORD5.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb23)) ? u_xlat5.xyz : vs_TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat5.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat23, u_xlat24);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat23 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat18.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat18.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_5.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_5.x;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat22 = u_xlat22 * u_xlat10_4.w;
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat5.x = vs_TEXCOORD2.w;
    u_xlat5.y = vs_TEXCOORD3.w;
    u_xlat5.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(vec2(u_xlat16), vec2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = u_xlat16 * u_xlat3.x + 1.0;
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = u_xlat16 * u_xlat10 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = abs(u_xlat21) * u_xlat3.x + u_xlat22;
    u_xlat3.x = u_xlat23 * u_xlat3.x + u_xlat22;
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = u_xlat23 * u_xlat10 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = u_xlat2.x * u_xlat22 + (-u_xlat2.x);
    u_xlat2.x = u_xlat3.x * u_xlat2.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 9.99999975e-05);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = vec3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xzw + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 _LightShadowData;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
float u_xlat16_9;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = max(abs(u_xlat0.z), u_xlat9);
    u_xlat9 = u_xlat9 + (-_LightProjectionParams.z);
    u_xlat9 = max(u_xlat9, 9.99999975e-06);
    u_xlat9 = u_xlat9 * _LightProjectionParams.w;
    u_xlat9 = _LightProjectionParams.y / u_xlat9;
    u_xlat9 = u_xlat9 + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat0.xyz,u_xlat9);
    u_xlat10_0 = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat3.x = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat10_0 * u_xlat3.x + _LightShadowData.x;
    u_xlat3.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat3.xx);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD4.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat1.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.x * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    vs_TEXCOORD2 = u_xlat1.wwwx;
    vs_TEXCOORD3 = u_xlat1.wwwy;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	vec4 _LightShadowData;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
float u_xlat16_3;
float u_xlat9;
float u_xlat16_9;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD5.xyz + (-_LightPositionRange.xyz);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = max(abs(u_xlat0.z), u_xlat9);
    u_xlat9 = u_xlat9 + (-_LightProjectionParams.z);
    u_xlat9 = max(u_xlat9, 9.99999975e-06);
    u_xlat9 = u_xlat9 * _LightProjectionParams.w;
    u_xlat9 = _LightProjectionParams.y / u_xlat9;
    u_xlat9 = u_xlat9 + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat0.xyz,u_xlat9);
    u_xlat10_0 = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat3.x = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat10_0 * u_xlat3.x + _LightShadowData.x;
    u_xlat3.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat3.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat16_3 = u_xlat10_2.w * u_xlat10_1.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD4.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat1.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.x * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
CustomEditor "StandardShaderGUI"
Fallback "VertexLit"
}
