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
    
    private var _color: UIColor = UIColor.white
    
    private var _nib: NibView? = nil
    
    private var nibRect: CGRect = CGRect.zero
    
    private var context: CGContext? = nil
    
    override func draw(_ rect: CGRect) {
        _nib = NibView()
        
        // TODO: What if bounds.size.width is > bounds.size.height
        _wheelRect = CGRect(x: 52.0, y: 50.0, width: bounds.size.width / 1.5, height: bounds.size.height / 1.5)
        
        context = UIGraphicsGetCurrentContext()!
        //context.setFillColor(UIColor.lightGray.cgColor)
        //context.addEllipse(in: _wheelRect)
        //context.drawPath(using: .fill)
        
        nibRect = CGRect(x: 0.0, y: _wheelRect.size.height / 2.0, width: _wheelRect.width / 10.0, height: _wheelRect.height / 8.0)
        
        
        //nibRect.origin.x = _wheelRect.midX + (_wheelRect.width * 0.4) * cos(angle) - nibRect.width / 2.0
        //nibRect.origin.y = _wheelRect.midY + (_wheelRect.width * 0.4) * sin(angle) - nibRect.height / 2.0
        
        let width: Int = Int(bounds.size.width)
        let height: Int = Int(bounds.size.height)
        
        for var x in 0...width
        {
            for var y in 0...height
            {
                let color: UIColor = colorFromColorWheelWithBoundingRect(rect: _wheelRect, point: CGPoint(x: x, y: y), brightness: 1.0, alpha: 1.0)
                color.setStroke()
                context?.addRect(CGRect(x: x, y: y, width: 1, height: 1))
                context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
            }
        }
        
        
        
        nibRect.origin.x = _wheelRect.midX + (_touchPoint.x) - nibRect.width / 2.0
        nibRect.origin.y = _wheelRect.midY + (_touchPoint.y) - nibRect.height / 2.0
        
        _color = colorFromColorWheelWithBoundingRect(rect: _wheelRect, point: CGPoint(x: nibRect.origin.x, y: nibRect.origin.y), brightness: 1.0, alpha: 1.0)
        
        sendActions(for: .valueChanged)
        
        context?.setFillColor(_color.cgColor)
        context?.setStrokeColor(UIColor.darkGray.cgColor)
        context?.setLineWidth(1.5)
        context?.addEllipse(in: nibRect)
        
        //context?.drawPath(using: .fillStroke)
        
        
        _nib?.color = _color
        _nib?.changeOX(xPos: _wheelRect.midX + (_touchPoint.x) - (_nib?.width)! / 2.0)
        _nib?.changeOY(yPos: _wheelRect.midY + (_touchPoint.y) - (_nib?.height)! / 2.0)
        addSubview(_nib!) // not actually working
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        _touchPoint.x -= _wheelRect.midX
        _touchPoint.y -= _wheelRect.midY
        
        angle = atan2((_touchPoint.y), (_touchPoint.x))
        
        _color = colorFromColorWheelWithBoundingRect(rect: _wheelRect, point: CGPoint(x: nibRect.origin.x, y: nibRect.origin.y), brightness: 1.0, alpha: 1.0)
        
        drawNib()
        sendActions(for: .valueChanged)
        //setNeedsDisplay()
    }
    
    private func drawNib()
    {

        nibRect.origin.x = _wheelRect.midX + (_touchPoint.x) - nibRect.width / 2.0
        nibRect.origin.y = _wheelRect.midY + (_touchPoint.y) - nibRect.height / 2.0
        
        context?.setFillColor(_color.cgColor)
        context?.setStrokeColor(UIColor.darkGray.cgColor)
        context?.setLineWidth(1.5)
        context?.addEllipse(in: nibRect)
        
        context?.drawPath(using: .fillStroke)
        NSLog("Wheel orig:  x:(\(_wheelRect.midX)) y:(\(_wheelRect.midY))")
        NSLog("Nib:         x:(\(nibRect.origin.x)) y:(\(nibRect.origin.y))")
        //setNeedsDisplay()
    }
    
    var angle: CGFloat {
        get {
            return _angle
        }
        set {
            _angle = newValue
            //setNeedsDisplay()
        }
    }
    
    var color: UIColor { return _color }
    
    func colorFromColorWheelWithBoundingRect(rect: CGRect, point: CGPoint, brightness: CGFloat, alpha: CGFloat) -> UIColor
    {
        var alphaA = alpha
        let pi = M_PI
        
        // Calculate the origin of the bounding rect and the 2D vector (stuffed in a CGPoint) from the origin to the touch point
        let o: CGPoint = CGPoint(x: rect.origin.x + rect.size.width * 0.5, y: rect.origin.y + rect.size.height * 0.5)
        let v: CGPoint = CGPoint(x: point.x - o.x, y: point.y - o.y)
    
        let atantwo = atan2(Double(v.y), Double(-v.x))
        // Calculate the hue and saturation values associated with the relative touch vector
        let hue: Double = (atantwo + pi) / pi * 0.5
        let hueF: CGFloat = CGFloat(hue)
        
        var saturation: Double = sqrt((Double(v.x) * Double(v.x)) + (Double(v.y) * Double(v.y))) / (Double(rect.size.width) * 0.5)
        let saturationF: CGFloat = CGFloat(saturation)

        // Values outside the range of unit saturation are clipped
        if (saturation > 1.0)
        {
            saturation = 1.0
            alphaA = 0.0
        }
    
        // Convert components into a UIColor and return it
        return UIColor(hue: hueF, saturation: saturationF, brightness: brightness, alpha: alphaA)
        
    }
}
