//
//  ColorWheelView.siwft.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class ColorWheelView: UIControl {
    private var _wheelRect: CGRect = CGRect.zero
    private var _angle: CGFloat = 0.0
    
    private var _touchPoint: CGPoint = CGPoint.zero
    
    override func draw(_ rect: CGRect) {
        // TODO: What if bounds.size.width is > bounds.size.height
        _wheelRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.height)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: _wheelRect)
        context.drawPath(using: .fill)
        
        var nibRect: CGRect = CGRect(x: 0.0, y: _wheelRect.size.height / 2.0, width: _wheelRect.width / 10.0, height: _wheelRect.height / 10.0)
        
        
        //nibRect.origin.x = _wheelRect.midX + (_wheelRect.width * 0.4) * cos(angle) - nibRect.width / 2.0
        //nibRect.origin.y = _wheelRect.midY + (_wheelRect.width * 0.4) * sin(angle) - nibRect.height / 2.0
        
        
        
        if (_touchPoint.x > _wheelRect.width)
        {
            nibRect.origin.x = _wheelRect.width
        }
        else
        {
            nibRect.origin.x = _wheelRect.midX + (_touchPoint.x) - nibRect.width / 2.0
            nibRect.origin.y = _wheelRect.midY + (_touchPoint.y) - nibRect.height / 2.0
        }
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        _touchPoint.x -= _wheelRect.midX
        _touchPoint.y -= _wheelRect.midY
        
        angle = atan2((_touchPoint.y), (_touchPoint.x))
        sendActions(for: .valueChanged)
        
    }
    
    var angle: CGFloat {
        get {
            return _angle
        }
        set {
            _angle = newValue
            setNeedsDisplay()
        }
    }
}
