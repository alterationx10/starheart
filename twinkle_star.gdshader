shader_type canvas_item;

uniform vec4 white : source_color = vec4(1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV); //read from texture
	if (COLOR.a >= 0.1 && COLOR != white) {
		COLOR = vec4(UV, 0.5, 1.0);	
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
