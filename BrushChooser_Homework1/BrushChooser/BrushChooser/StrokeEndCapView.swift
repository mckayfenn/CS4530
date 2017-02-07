//
//  StrokeEndcapView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeEndCapView: UIControl {
    
    private var _buttButton: CGRect = CGRect.zero
    private var _roundButton: CGRect = CGRect.zero
    private var _squareButton: CGRect = CGRect.zero
    
    private var _touchPoint: CGPoint = CGPoint.zero
    
    
    override func draw(_ rect: CGRect) {
        
        
        _buttButton = CGRect(x: 0.0, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _roundButton = CGRect(x: bounds.midX - bounds.width / 6, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _squareButton = CGRect(x: bounds.maxX - bounds.width / 3, y: 0.0, width: bounds.width / 3, height: bounds.height)
        
        
        
        
        //_buttButton.addTarget(self, action: #selector(buttSelected), for: UIControlEvents.touchDown)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        
        // draw line for .butt
        context.move(to: CGPoint(x: _buttButton.midX - 25.0, y: _buttButton.midY))
        context.addLine(to: CGPoint(x: _buttButton.midX + 25.0, y: _buttButton.midY))
        context.setLineCap(.butt)
        UIColor.white.setStroke()
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        
        // draw line for .round
        context.move(to: CGPoint(x: _roundButton.midX - 25.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _roundButton.midX + 25.0, y: bounds.midY))
        context.setLineCap(.round)
        context.drawPath(using: .fillStroke)
        
        // draw line for .square
        context.move(to: CGPoint(x: _squareButton.midX - 25.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _squareButton.midX + 25.0, y: bounds.midY))
        context.setLineCap(.square)
        context.drawPath(using: .fillStroke)
        
        
    }
    
    
    
    func buttSelected() {
            NSLog(".butt was selected in stroke view")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        sendActions(for: .touchDown)
    }
    
    var touchPoint: CGPoint { return _touchPoint }
    var buttButton: CGRect? { return _buttButton }
    var roundButton: CGRect? { return _roundButton }
    var squareButton: CGRect? { return _squareButton }
}


