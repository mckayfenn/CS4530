//
//  PaintingView.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/21/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingView: UIView {
    //var lines: PolyLine = PolyLine()
    var painting: Painting = Painting()
    var context: CGContext? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func draw(_ rect: CGRect) {
        context = UIGraphicsGetCurrentContext()!
        
        
        for line in painting.lines {
            for point in line.points {
                if (point.equalTo(line.points.first!)) {
                    context?.move(to: point)
                }
                else {
                    context?.addLine(to: point)
                }
            }
            context?.setStrokeColor(line.color.cgColor)
            context?.setLineWidth(line.width)
            context?.setLineCap(line.cap)
            context?.setLineJoin(line.join)
            context?.drawPath(using: .stroke)
        }
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        painting.addLine(line: Line())
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch: UITouch = touches.first!
//        
//        let touchPoint = touch.location(in: self)
//        painting.lines.last?.addPoint(point: touchPoint)
//        //NSLog("\(touchPoint)")
//        setNeedsDisplay()
//    }
    
    
    

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
