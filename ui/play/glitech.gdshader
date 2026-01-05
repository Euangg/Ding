shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float intensity:hint_range(0.0,1.0)=0.5;
uniform float speed:hint_range(0.0,5.0)=1.0;

//颜色通道偏移参数
uniform float rgb_split_intensity:hint_range(0.0,0.1)=0.02;
uniform bool enable_rgb_split=true;

//随机块干扰参数
uniform float block_size:hint_range(2.0, 100.0)=20.0;
uniform float block_intensity:hint_range(0.0, 1.0)=0.1;

//扫描线抖动参数
uniform float line_speed:hint_range(0.0, 100.0)=50.0;
uniform float line_intensity:hint_range(0.0, 1.0)=0.1;

//噪声纹理
uniform sampler2D noise_texture:hint_default_white;

float rand(vec2 co){
	return fract(sin(dot(co.xy,vec2(12.9898,78.233)))*43758.5453);
}

void fragment() {
	vec2 uv=UV;
	//1.基于时间的随机种子
	float t=floor(TIME*20.0*speed);
	vec2 random_seed=uv+t;

	//2.随机块状干扰
	vec2 block_uv=floor(uv*block_size)/block_size;
	float block_noise=rand(block_uv+t);

	if(block_noise>0.9-intensity*0.1){
		vec2 block_offset=vec2(
			rand(block_uv+vec2(13.0,7.0))-0.5,
			rand(block_uv+vec2(29.0,31.0))-0.5
		)*block_intensity*intensity;
		uv+=block_offset;
	}

	//3.颜色通道分离
	vec4 final_color;
	if(enable_rgb_split){
		float split_amount=rgb_split_intensity*intensity*rand(vec2(t,0.0));
		float r=textureLod(screen_texture,vec2(uv.x+split_amount,uv.y),0.0).r;
		float g=textureLod(screen_texture,uv,0.0).g;
		float b=textureLod(screen_texture,vec2(uv.x-split_amount,uv.y),0.0).b;
		final_color=vec4(r,g,b,textureLod(screen_texture,uv,0.0).a);
	}else{final_color=textureLod(screen_texture,uv,0.0);}

	//4.扫描线抖动
	float line_noise=sin(uv.y*line_speed+TIME*10.0);
	if(abs(line_noise)>0.999-line_intensity*10.0*intensity){
		final_color.rgb=textureLod(screen_texture,
		vec2(uv.x+line_intensity*intensity*(rand(vec2(uv.y,t))-0.5)*2.0,uv.y),0.0).rgb;
	}

	//5.整体颜色干扰
	float global_noise=rand(vec2(t,uv.y));
	if(global_noise>0.995-intensity*0.05){
		//如果有外部噪声纹理
		if(texture(noise_texture,vec2(1.0)).r>0.001){//检查纹理是否存在
			final_color.rgb=texture(noise_texture,uv*2.0).rgb;
		}else{
			final_color.rgb=vec3(rand(uv+t),rand(uv+t+0.1),rand(uv+t+0.2));
		}
	}

	COLOR=final_color;
}