//
//  StrokeJoinView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeJoinView: UIControl {
    private var _miterJoin: CGRect = CGRect.zero
    private var _roundJoin: CGRect = CGRect.zero
    private var _bevelJoin: CGRect = CGRect.zero
    
    private var _touchPoint: CGPoint = CGPoint.zero
    
    override func draw(_ rect: CGRect) {
        _miterJoin = CGRect(x: 0.0, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _roundJoin = CGRect(x: bounds.midX - bounds.width / 6, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _bevelJoin = CGRect(x: bounds.maxX - bounds.width / 3, y: 0.0, width: bounds.width / 3, height: bounds.height)
        
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // draw line for .miter
        context.move(to: CGPoint(x: _miterJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.miter)
        UIColor.white.setStroke()
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        
        // draw line for .round
        context.move(to: CGPoint(x: _roundJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.round)
        context.drawPath(using: .fillStroke)
        
        // draw line for .bevel
        context.move(to: CGPoint(x: _bevelJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.bevel)
        context.drawPath(using: .fillStroke)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        sendActions(for: .touchDown)
    }
    
    var touchPoint: CGPoint { return _touchPoint }
    var miterJoin: CGRect? { return _miterJoin }
    var roundJoin: CGRect? { return _roundJoin }
    var bevelJoin: CGRect? { return _bevelJoin }
}
