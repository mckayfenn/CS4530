//
//  StrokeEndcapView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeEndCapView: UIControl {
    private var _endCap: CGRect = CGRect.zero
    
    override func draw(_ rect: CGRect) {
        _endCap = CGRect(x: 0.0, y: 300.0, width: bounds.size.width, height: bounds.size.height)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.move(to: CGPoint(x: 0.0, y: 0.0))
        context.addLine(to: CGPoint(x: 10.0, y: 0.0))
        context.setLineCap(.butt)
        UIColor.red.setStroke()
        context.drawPath(using: .fillStroke)
        
        // trying a different way to draw
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: 10.0, y: 300.0))
        aPath.addLine(to: CGPoint(x: 30.0, y: 300.0))
        
        aPath.close()
        
        UIColor.red.set()
        aPath.stroke()
        aPath.fill()
    }
}


