#version 320 es
precision mediump float;

uniform sampler2D screenTex;
uniform vec2 screenSize;

out vec4 fragColor;

float brightness = 1.0;
float contrast = 0.95;

void main() {
    vec2 uv = gl_FragCoord.xy / screenSize;
    vec4 color = texture(screenTex, uv);
    float gray = (color.r + color.g + color.b) / (3.0 / brightness);
	vec4 c = vec4(gray, gray, gray, 1.0);

	fragColor = (c - 0.5) * contrast + 0.5;
}

