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
        _endCap = CGRect(x: bounds.midX, y: bounds.midY, width: bounds.size.width, height: bounds.size.height)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.move(to: CGPoint(x: bounds.minX + 20.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: bounds.minX + 50.0, y: bounds.midY))
        context.setLineCap(.butt)
        UIColor.red.setStroke()
        context.setLineWidth(10.0)
        context.drawPath(using: .fillStroke)
        

        context.move(to: CGPoint(x: (bounds.midX) - 15.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: (bounds.midX) + 25.0, y: bounds.midY))
        context.setLineCap(.round)
        context.drawPath(using: .fillStroke)
        
        context.move(to: CGPoint(x: bounds.maxX - 50.0, y: bounds.midY))
        context.addLine(to: CGPoint(x: bounds.maxX - 20.0, y: bounds.midY))
        context.setLineCap(.square)
        context.drawPath(using: .fillStroke)
    }
}


