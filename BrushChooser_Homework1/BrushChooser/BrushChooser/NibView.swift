//
//  NibView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/7/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class NibView: UIView
{
    private var _container: CGRect = CGRect.zero
    private var _nibRect: CGRect = CGRect.zero
    private var _color: UIColor = UIColor.white
    override func draw(_ rect: CGRect) {
        _container = CGRect(x: 52.0, y: 50.0, width: bounds.size.width / 1.5, height: bounds.size.height / 1.5)
        
        _nibRect = CGRect(x: 0.0, y: _container.size.height / 2.0, width: _container.size.width / 10.0, height: _container.size.height / 8.0)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(_color.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1.5)
        context.addEllipse(in: _nibRect)
        context.drawPath(using: .fillStroke)
    }
    
    func changeOX(xPos: CGFloat)
    {
        _nibRect.origin.x = xPos
        setNeedsDisplay()
    }
    func changeOY(yPos: CGFloat)
    {
        _nibRect.origin.y = yPos
        setNeedsDisplay()
    }
    
    var width: CGFloat
    {
        return _nibRect.width
    }
    var height: CGFloat
    {
        return _nibRect.height
    }
    
    var color: UIColor
    {
        get { return _color }
        set
        {
            NSLog("new nib color \(_color)")
            _color = newValue
            setNeedsDisplay()
        }
    }
}
