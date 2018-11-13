// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33084,y:32559,varname:node_3138,prsc:2|emission-6761-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9083,x:31957,y:32957,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5295,x:32265,y:32643,varname:_node_5295,prsc:2,ntxv:0,isnm:False|UVIN-5929-OUT,TEX-9083-TEX;n:type:ShaderForge.SFN_TexCoord,id:2654,x:31492,y:32723,varname:node_2654,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:132,x:31633,y:32354,varname:_fdg,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-84-UVOUT,TEX-8728-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:8728,x:31349,y:32485,ptovrint:False,ptlb:Video,ptin:_Video,varname:_Video,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:5929,x:32020,y:32655,varname:node_5929,prsc:2|A-2654-UVOUT,B-1997-OUT,T-6938-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6938,x:31602,y:32951,ptovrint:False,ptlb:Distortion,ptin:_Distortion,varname:_Distortion,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_RemapRange,id:1997,x:32103,y:32369,varname:node_1997,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-1744-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9830,x:32372,y:32861,ptovrint:False,ptlb:Amount,ptin:_Amount,varname:_Amount,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:84,x:31146,y:32234,varname:node_84,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:1744,x:31871,y:32369,varname:node_1744,prsc:2|A-132-R,B-132-R;n:type:ShaderForge.SFN_Multiply,id:5926,x:32596,y:32827,varname:node_5926,prsc:2|A-5295-R,B-9830-OUT;n:type:ShaderForge.SFN_Add,id:6761,x:32679,y:32329,varname:node_6761,prsc:2|A-132-RGB,B-5926-OUT;proporder:9083-8728-6938-9830;pass:END;sub:END;*/

Shader "Shader Forge/CamBlend" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        _Video ("Video", 2D) = "white" {}
        _Distortion ("Distortion", Float ) = 1
        _Amount ("Amount", Float ) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Video; uniform float4 _Video_ST;
            uniform float _Distortion;
            uniform float _Amount;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _fdg = tex2D(_Video,TRANSFORM_TEX(i.uv0, _Video));
                float2 node_5929 = lerp(i.uv0,(float2(_fdg.r,_fdg.r)*0.5+0.5),_Distortion);
                float4 _node_5295 = tex2D(_MainTex,TRANSFORM_TEX(node_5929, _MainTex));
                float3 emissive = (_fdg.rgb+(_node_5295.r*_Amount));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
