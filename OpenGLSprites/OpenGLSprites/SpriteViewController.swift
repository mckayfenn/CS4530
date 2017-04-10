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
    
    private var texture: GLKTextureInfo? = nil
    
    private var mario1: Sprite!
    private var mario2: Sprite!
    private var mario3: Sprite!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let context = EAGLContext(api: .openGLES2)
        glkView.context = context!
        EAGLContext.setCurrent(context)
        
        // enable alpha blending
        glEnable(GLenum(GL_BLEND))
        glBlendFunc(GLenum(GL_SRC_ALPHA), GLenum(GL_ONE_MINUS_SRC_ALPHA))
        
        mario1 = Sprite(image: UIImage(named: "mario")!)
        mario2 = Sprite(image: UIImage(named: "mario")!)
        mario3 = Sprite(image: UIImage(named: "mario")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func update() {
        
        translateX -= 0.002
        translateY -= 0.001
        
        mario1.positionX = translateX
        mario1.positionY = translateY
        mario1.rotation = mario1.rotation - 0.01
        mario1.scaleX = mario1.scaleX + 0.001
        mario1.scaleY = mario1.scaleY + 0.001
        
        mario2.positionX = -translateX
        mario2.positionY = translateY
        mario2.rotation = mario2.rotation + 0.01
        
        mario3.positionY = -translateY
        mario3.rotation = mario3.rotation + 0.01
    }
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(0.75, 0.75, 0.75, 1.0)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        
       
        
        mario1?.draw()
        mario2?.draw()
        mario3?.draw()

    }

    
    private var glkView: GLKView {
        return view as! GLKView
    }
}

