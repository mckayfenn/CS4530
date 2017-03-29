//
//  SpriteViewController.swift
//  OpenGLSprites
//
//  Created by u0939404 on 3/29/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import GLKit

class SpriteViewController: GLKViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        glkView.context = EAGLContext(api: .openGLES2)
        
        
        let vertexShaderPath: String = Bundle.main.path(forResource: "vertex", ofType: "glsl", inDirectory: nil)!
        let vertexShaderSource: NSString = try! NSString(contentsOfFile: vertexShaderPath, encoding: String.Encoding.utf8.rawValue)
        NSLog("Vertex Source: \(vertexShaderSource)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private var glkView: GLKView {
        return view as! GLKView
    }
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(0.0, 1.0, 0.0, 1.0)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        
    }

}

