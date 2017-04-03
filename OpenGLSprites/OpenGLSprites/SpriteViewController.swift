//
//  SpriteViewController.swift
//  OpenGLSprites
//
//  Created by u0939404 on 3/29/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import GLKit

class SpriteViewController: GLKViewController {

    private var translateX: Float = 0
    private var translateY: Float = 0
    
    private var program: GLuint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let context = EAGLContext(api: .openGLES2)
        glkView.context = context!
        EAGLContext.setCurrent(context)
        
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(0.0, 1.0, 0.0, 1.0)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        
        translateX -= 0.002
        translateY -= 0.001
        
        
        // Send Geometry (attributes)
        // Send any other info (uniforms)
        // Draw
        let triangle: [Float] = [
            // bottom right triangle
            0.0, 0.0,
            1.0, 0.0,
            1.0, 1.0,
            
            // top left triangle
            0.0, 0.0,
            0.0, 1.0,
            1.0, 1.0,
        ]
        
        // TODO: Matt, normalized? why false?
        glVertexAttribPointer(0, 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 8, triangle)
        glUniform2f(glGetUniformLocation(program, "translate"), translateX, translateY)
        
        glDrawArrays(GLenum(GL_TRIANGLES), 0, 6)
    }

    
    private var glkView: GLKView {
        return view as! GLKView
    }
}

