//
//  BrushPreviewView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class BrushPreviewView: UIView {
    
    private var _preview: CGRect = CGRect.zero
    
    private var _capState: CGLineCap = CGLineCap.butt
    private var _joinState: CGLineJoin = CGLineJoin.miter
    private var _width: CGFloat = 0.5
    private var _color: UIColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        _preview = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.width)
    
        
        // draw a line with all the updates from the inputs
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.clear(_preview)  // This was all I needed for it to draw correctly.
        
        context.move(to: CGPoint(x: 10.0, y: bounds.height / 3))
        context.addLine(to: CGPoint(x: 30.0, y: bounds.height - bounds.height / 4))
        context.addLine(to: CGPoint(x: 60.0, y: bounds.height / 2))
        context.addLine(to: CGPoint(x: 100.0, y: bounds.height / 5))
        context.addLine(to: CGPoint(x: 200.0, y: bounds.height - bounds.height / 5))
        context.setLineJoin(_joinState)
        context.setLineCap(_capState)
        context.setLineWidth(_width)
        context.setStrokeColor(_color.cgColor)
        context.drawPath(using: .stroke)
    }
    
    var capState: CGLineCap
    {
        get { return _capState }
        set
        {
            _capState = newValue
            setNeedsDisplay()
        }
    }
    
    var joinState: CGLineJoin
    {
        get { return _joinState }
        set
        {
            _joinState = newValue
            setNeedsDisplay()
        }
    }
    
    var width: CGFloat
    {
        get { return _width }
        set
        {
            _width = newValue
            setNeedsDisplay()
        }
    }
    
    var color: UIColor
    {
        get { return _color }
        set
        {
            _color = newValue
            setNeedsDisplay()
        }
    }
    
}
