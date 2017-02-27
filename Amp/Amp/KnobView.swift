//
//  KnobView.swift
//  Arrows
//
//  Created by u0939404 on 1/25/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class KnobView: UIView {
    private var _knobRect: CGRect = CGRect.zero
    private var _angle: CGFloat = 0.0
    
    
    override func draw(_ rect: CGRect) {
        // TODO: What if bounds.size.width is > bounds.size.height
        _knobRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.width)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: _knobRect)
        context.drawPath(using: .fill)
        
        var nibRect: CGRect = CGRect(x: 0.0, y: _knobRect.size.height / 2.0, width: _knobRect.width / 10.0, height: _knobRect.height / 10.0)
        
        
        nibRect.origin.x = _knobRect.midX + (_knobRect.width * 0.4) * cos(angle) - nibRect.width / 2.0
        nibRect.origin.y = _knobRect.midY + (_knobRect.width * 0.4) * sin(angle) - nibRect.height / 2.0
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        var touchPoint: CGPoint = touch.location(in: self)
        
        //NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
        
        touchPoint.x -= _knobRect.midX //(_knobRect.origin.x + _knobRect.width / 2.0
        touchPoint.y -= _knobRect.midY
        
        //NSLog("Modified   x: \(touchPoint.x) y: \(touchPoint.y)")
        
        angle = atan2(touchPoint.y, touchPoint.x)
        //sendActions(for: .valueChanged)
        valueChangedHandler?()
        //NSLog("Angle: \(angle)")
        
        
//        x = r*cos(theta)
//        y = r*sin(theta)
//        
//        r = sqrt(x*x + y*y)
//        theta = atan2(y, x)
    }
    
    var angle: CGFloat {
        get{
            return _angle
        }
        set {
            _angle = newValue
            // TODO: angle bounds?
            setNeedsDisplay()
        }
    }
    
//    var value: CGFloat
//    var valueMin: CGFloat
//    var valueMax: CGFloat
    
    
    var valueChangedHandler: ( () -> Void)?
}
