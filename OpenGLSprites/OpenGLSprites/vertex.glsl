
attribute vec2 position;


uniform vec2 translate;


attribute vec4 color;
varying vec4 colorInterpolated;


attribute vec2 texturePos;
varying vec2 texturePosInterpolated;


void main() {
    gl_Position = vec4(position.x + translate.x, position.y + translate.y, 0.0, 1.0);
    
    colorInterpolated = color;
    
    texturePosInterpolated = texturePos;
}
