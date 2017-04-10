//
//  Sprite.swift
//  OpenGLSprites
//
//  Created by u0939404 on 4/5/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import GLKit

class Sprite {
    
    var positionX: Float = 0.0
    var positionY: Float = 0.0
    
    var scaleX: Float = 1.0
    var scaleY: Float = 1.0
    
    var rotation: Float = 0.0
    
    let image: UIImage
    
    private let texture: GLKTextureInfo?
    
    private static var program: GLuint = 0
    
    
    private static let quad: [Float] = [
        // PT1
        0.5, -0.5, // X, Y
        1.0, 0.0, 0.0, 1.0, // Color (rgba)
        1.0, 1.0, // Texture info X, Y
        
        -0.5, -0.5,
        0.0, 1.0, 0.0, 1.0,
        0.0, 1.0,
        
        0.5, 0.5,
        0.0, 0.0, 1.0, 1.0,
        1.0, 0.0,
        
        -0.5, 0.5,
        1.0, 0.5, 0.0, 1.0,
        0.0, 0.0
    ]
    
    init(image: UIImage) {
        
        self.image = image
        

        texture = try? GLKTextureLoader.texture(with: self.image.cgImage!, options: nil)
        
        // should only be called once
        Sprite.setup()
    }
    
    private static func setup() {
        
        // Only run the program a single time
        // if program is already created, return
        if program != 0 {
            return
        }
        
        print("Setting up sprite program")
        
        // Vertex shader
        let vertexShaderPath: String = Bundle.main.path(forResource: "vertex", ofType: "glsl", inDirectory: nil)!
        let vertexShaderSource: NSString = try! NSString(contentsOfFile: vertexShaderPath, encoding: String.Encoding.utf8.rawValue)
        
        var vertexShaderData = vertexShaderSource.cString(using: String.Encoding.utf8.rawValue)
        
        
        let vertexShader: GLuint = glCreateShader(GLenum(GL_VERTEX_SHADER))
        
        glShaderSource(vertexShader, 1, &vertexShaderData, nil)
        glCompileShader(vertexShader)
        
        var vertexShaderCompileStatus: GLint = GL_FALSE
        glGetShaderiv(vertexShader, GLenum(GL_COMPILE_STATUS), &vertexShaderCompileStatus)
        if vertexShaderCompileStatus == GL_FALSE {
            // TODO: Handle error
            
            var logLength: GLint = 0
            glGetShaderiv(vertexShader, GLenum(GL_INFO_LOG_LENGTH), &logLength)
            let logBuffer = UnsafeMutablePointer<GLchar>.allocate(capacity: Int(logLength))
            
            // TODO: Matt: What is length (3rd param)
            glGetShaderInfoLog(vertexShader, logLength, nil, logBuffer)
            
            let logString: String = String(cString: logBuffer)
            
            print(logString)
            fatalError("Error: Vertex Shader did not compile")
        }
        else {
            print("compiled :)")
        }
        
        
        
        
        
        
        
        // Fragment shader
        let fragmentShaderPath: String = Bundle.main.path(forResource: "fragment", ofType: "glsl", inDirectory: nil)!
        let fragmentShaderSource: NSString = try! NSString(contentsOfFile: fragmentShaderPath, encoding: String.Encoding.utf8.rawValue)
        
        var fragmentShaderData = fragmentShaderSource.cString(using: String.Encoding.utf8.rawValue)
        
        
        let fragmentShader: GLuint = glCreateShader(GLenum(GL_FRAGMENT_SHADER))
        
        glShaderSource(fragmentShader, 1, &fragmentShaderData, nil)
        glCompileShader(fragmentShader)
        
        var fragmentShaderCompileStatus: GLint = GL_FALSE
        glGetShaderiv(fragmentShader, GLenum(GL_COMPILE_STATUS), &fragmentShaderCompileStatus)
        if fragmentShaderCompileStatus == GL_FALSE {
            // TODO: Handle error
            
            var logLength: GLint = 0
            glGetShaderiv(fragmentShader, GLenum(GL_INFO_LOG_LENGTH), &logLength)
            let logBuffer = UnsafeMutablePointer<GLchar>.allocate(capacity: Int(logLength))
            
            // TODO: Matt: What is length (3rd param)
            glGetShaderInfoLog(fragmentShader, logLength, nil, logBuffer)
            
            let logString: String = String(cString: logBuffer)
            
            print(logString)
            fatalError("Error: Fragment Shader did not compile")
        }
        else {
            print("compiled :)")
        }
        
        
        
        
        
        // Compile program
        
        program = glCreateProgram()
        glAttachShader(program, vertexShader)
        glAttachShader(program, fragmentShader)
        glBindAttribLocation(program, 0, "position")
        glBindAttribLocation(program, 1, "color")
        glBindAttribLocation(program, 2, "texturePos")
        glLinkProgram(program)
        
        var linkStatus: GLint = GL_FALSE
        glGetProgramiv(program, GLenum(GL_LINK_STATUS), &linkStatus)
        if linkStatus == GL_FALSE {
            // Get log as string
            var logLength: GLint = 0
            glGetProgramiv(program, GLenum(GL_INFO_LOG_LENGTH), &logLength)
            let logBuffer = UnsafeMutablePointer<GLchar>.allocate(capacity: Int(logLength))
            
            // TODO: Matt: What is length (3rd param)
            glGetProgramInfoLog(program, logLength, nil, logBuffer)
            
            let logString: String = String(cString: logBuffer)
            
            print(logString)
            
            fatalError("Error: Program did not link")
        }
        
        glUseProgram(program)
        
        glEnableVertexAttribArray(0)
        glEnableVertexAttribArray(1)
        glEnableVertexAttribArray(2)
        

    }
    
    func draw() {

        
        // TODO: Matt, normalized? why false?
        // position information
        glVertexAttribPointer(0, 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 32, Sprite.quad)
        // Color information
        glVertexAttribPointer(1, 4, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 32, UnsafePointer(Sprite.quad) + 2)
        // Texture information
        glVertexAttribPointer(2, 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 32, UnsafePointer(Sprite.quad) + 6)
        
        // Translation info
        glUniform2f(glGetUniformLocation(Sprite.program, "translate"), positionX, positionY)
        glUniform2f(glGetUniformLocation(Sprite.program, "scale"), scaleX, scaleY)
        glUniform1f(glGetUniformLocation(Sprite.program, "rotation"), rotation)
        
        // for matrices
        //glUniformMatrix4fv(<#T##location: GLint##GLint#>, <#T##count: GLsizei##GLsizei#>, <#T##transpose: GLboolean##GLboolean#>, <#T##value: UnsafePointer<GLfloat>!##UnsafePointer<GLfloat>!#>)
        
        
        // bind the texture
        if let texture = texture {
            glBindTexture(GLenum(GL_TEXTURE), texture.name)
        }
        
        glDrawArrays(GLenum(GL_TRIANGLE_STRIP), 0, 4)
        
    }
}
