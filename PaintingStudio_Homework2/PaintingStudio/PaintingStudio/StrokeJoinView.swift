//
//  StrokeJoinView.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/22/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import Foundation
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
    
    private var _miter: Bool = true
    private var _round: Bool = false
    private var _bevel: Bool = false
    
    override func draw(_ rect: CGRect) {
        _miterJoin = CGRect(x: 0.0, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _roundJoin = CGRect(x: bounds.midX - bounds.width / 6, y: 0.0, width: bounds.width / 3, height: bounds.height)
        _bevelJoin = CGRect(x: bounds.maxX - bounds.width / 3, y: 0.0, width: bounds.width / 3, height: bounds.height)
        
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        var activeColor: UIColor = UIColor.yellow
        var notActiveColor: UIColor = UIColor.white
        
        // draw line for .miter
        context.move(to: CGPoint(x: _miterJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.miter)
        if (_miter == true)
        {
            activeColor.setStroke()
        }
        else
        {
            notActiveColor.setStroke()
        }
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        // line inside miter
        context.move(to: CGPoint(x: _miterJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _miterJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.miter)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
        
        // draw line for .round
        context.move(to: CGPoint(x: _roundJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.round)
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
        // line inside round
        context.move(to: CGPoint(x: _roundJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _roundJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.round)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
        
        // draw line for .bevel
        context.move(to: CGPoint(x: _bevelJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.bevel)
        if (_bevel == true)
        {
            activeColor.setStroke()
        }
        else
        {
            notActiveColor.setStroke()
        }
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        // line inside bevel
        context.move(to: CGPoint(x: _bevelJoin.midX - 30.0, y: bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX, y: bounds.midY + bounds.midY / 2))
        context.addLine(to: CGPoint(x: _bevelJoin.midX + 30.0, y: bounds.midY / 2))
        context.setLineJoin(.round)
        context.setLineWidth(0.5)
        UIColor.black.setStroke()
        context.drawPath(using: .stroke)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        _touchPoint = touch.location(in: self)
        
        sendActions(for: .touchDown)
        setNeedsDisplay()
    }
    
    func miterSelected()
    {
        //("miter true")
        _miter = true
        _round = false
        _bevel = false
    }
    func roundSelected()
    {
        //NSLog("round true")
        _miter = false
        _round = true
        _bevel = false
    }
    func bevelSelected()
    {
        //NSLog("bevel true")
        _miter = false
        _round = false
        _bevel = true
    }
    
    
    var touchPoint: CGPoint { return _touchPoint }
    var miterJoin: CGRect? { return _miterJoin }
    var roundJoin: CGRect? { return _roundJoin }
    var bevelJoin: CGRect? { return _bevelJoin }
}
