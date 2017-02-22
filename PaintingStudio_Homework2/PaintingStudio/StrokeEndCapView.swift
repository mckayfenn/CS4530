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
    
    private var _butt: Bool = true
    private var _round: Bool = false
    private var _square: Bool = false
    
    
    override func draw(_ rect: CGRect) {
        
        
        _buttButton = CGRect(x: 0.0, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _roundButton = CGRect(x: bounds.midX - bounds.width / 6, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _squareButton = CGRect(x: bounds.maxX - bounds.width / 3, y: 0.0, width: bounds.width / 3, height: bounds.height)
        
        
        
        
        //_buttButton.addTarget(self, action: #selector(buttSelected), for: UIControlEvents.touchDown)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        
        var activeColor: UIColor = UIColor.yellow
        var notActiveColor: UIColor = UIColor.white
        
        // draw line for .butt
        context.move(to: CGPoint(x: _buttButton.midX - 30.0, y: _buttButton.midY))
        context.addLine(to: CGPoint(x: _buttButton.midX + 30.0, y: _buttButton.midY))
        context.setLineCap(.butt)
        if (_butt == true)
        {
            activeColor.setStroke()
        }
        else
        {
            notActiveColor.setStroke()
        }
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        // line inside butt
        context.move(to: CGPoint(x: _buttButton.midX - 30.0, y: _buttButton.midY))
        context.addLine(to: CGPoint(x: _buttButton.midX + 30.0, y: _buttButton.midY))
        context.setLineCap(.butt)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
        
        
        
        
        // draw line for .round
        context.move(to: CGPoint(x: _roundButton.midX - 30.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _roundButton.midX + 30.0, y: bounds.midY))
        context.setLineCap(.round)
        if (_round == true)
        {
            activeColor.setStroke()
        }
        else
        {
            notActiveColor.setStroke()
        }
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        // line inside .round
        context.move(to: CGPoint(x: _roundButton.midX - 30.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _roundButton.midX + 30.0, y: bounds.midY))
        context.setLineCap(.round)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
        
        // draw line for .square
        context.move(to: CGPoint(x: _squareButton.midX - 30.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _squareButton.midX + 30.0, y: bounds.midY))
        context.setLineCap(.square)
        if (_square == true)
        {
            activeColor.setStroke()
        }
        else
        {
            notActiveColor.setStroke()
        }
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        // line inside .square
        context.move(to: CGPoint(x: _squareButton.midX - 30.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: _squareButton.midX + 30.0, y: bounds.midY))
        context.setLineCap(.square)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
        
        
    }
    
    
    
    func buttSelected()
    {
        NSLog(".butt is true, others false")
        _butt = true
        _round = false
        _square = false
    }
    
    func roundSelected()
    {
        NSLog(".round true, others false")
        _butt = false
        _round = true
        _square = false
    }
    func squareSelected()
    {
        _butt = false
        _round = false
        _square = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        sendActions(for: .touchDown)
        setNeedsDisplay()
    }
    
    var touchPoint: CGPoint { return _touchPoint }
    var buttButton: CGRect? { return _buttButton }
    var roundButton: CGRect? { return _roundButton }
    var squareButton: CGRect? { return _squareButton }
}


