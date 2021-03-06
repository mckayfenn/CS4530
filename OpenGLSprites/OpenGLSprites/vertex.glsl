
attribute vec2 position;
uniform vec2 translate;
uniform vec2 scale;
uniform float rotation;

// for matrices
//mat4 modelView;

attribute vec4 color;
varying vec4 colorInterpolated;


attribute vec2 texturePos;
varying vec2 texturePosInterpolated;


void main() {
    gl_Position = vec4(
                       (position.x * scale.x) * cos(rotation) - (position.y * scale.y) * sin(rotation) + translate.x,
                       (position.x * scale.x) * sin(rotation) + (position.y * scale.y) * cos(rotation) + translate.y,
                       0.0,
                       1.0);
    
    colorInterpolated = color;
    
    
    // for matrices
    //gl_Postion = modelView * vec4(position.x, positio.y, 0,0, 1.0)
    
    texturePosInterpolated = texturePos;
}
