shader_type canvas_item;

uniform float outline_width=1.0;
uniform vec4 outline_color:source_color=vec4(0,0,0,1);

varying float modulate;
void vertex() {modulate=COLOR.a;}

void fragment() {
	float center_alpha=COLOR.a;

	//计算描边
	vec4 round_alpha=vec4(
		texture(TEXTURE,UV+vec2(-TEXTURE_PIXEL_SIZE.x,0.)*outline_width).a,
		texture(TEXTURE,UV+vec2(TEXTURE_PIXEL_SIZE.x,0.)*outline_width).a,
		texture(TEXTURE,UV+vec2(0.,-TEXTURE_PIXEL_SIZE.y)*outline_width).a,
		texture(TEXTURE,UV+vec2(0.,TEXTURE_PIXEL_SIZE.y)*outline_width).a
	);
	float max_a=max(max(round_alpha.r,round_alpha.g),max(round_alpha.b,round_alpha.a));

	//执行描边渲染
	if(center_alpha==0.){
		COLOR=outline_color;
		COLOR.a*=max_a*modulate;
	}
}