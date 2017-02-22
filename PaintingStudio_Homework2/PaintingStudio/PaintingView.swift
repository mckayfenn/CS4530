//
//  PaintingView.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/21/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingView: UIControl {
    //var lines: PolyLine = PolyLine()
    var painting: Painting = Painting()
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.move(to: CGPoint(x: 0.0, y: 0.0))
        //context.addLine(to: CGPoint(x: 100.0, y: 100.0))
        
        for point in painting.points {
            context.addLine(to: point)
        }
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(10.0)
        context.drawPath(using: .stroke)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        
        let touchPoint = touch.location(in: self)
        painting.addPoint(point: touchPoint)
        NSLog("\(touchPoint)")
        setNeedsDisplay()
    }
}



//class PolyLine {
//    var points: [CGPoint] = []
//    var cap: CGLineCap = .butt
//    var join: CGLineJoin = .round
//    var width: CGFloat = 0.0
//    var color: UIColor = UIColor.black
//    
//    func addPoint(point: CGPoint) {
//        points.append(point)
//    }
//}
