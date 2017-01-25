//
//  KnobView.swift
//  Arrows
//
//  Created by u0939404 on 1/25/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class KnobView: UIView {
    override func draw(_ rect: CGRect) {
        // TODO: What if bounds.size.width is > bounds.size.height
        let knobRect: CGRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.width)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        
        var nibRect: CGRect = CGRect(x: 0.0, y: knobRect.size.height / 2.0, width: knobRect.width / 10.0, height: knobRect.height / 10.0)
        nibRect.origin.y -= nibRect.height / 2.0
        nibRect.origin.x = knobRect.width - nibRect.width
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
        NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
    }
}
