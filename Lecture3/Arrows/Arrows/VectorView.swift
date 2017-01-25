//
//  VectorView.swift
//  Arrows
//
//  Created by u0939404 on 1/23/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class VectorView: UIView {
    
    override init(frame: CGRect) {
        vectors = []
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.move(to: CGPoint(x:20.0, y: 30.0))
        
        for vector: Vector in vectors {
            context.addLine(to: CGPoint(x: CGFloat(vector.x), y: CGFloat(vector.y)))
        }
        
        
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    var vectors: [Vector] {
        didSet {
            setNeedsLayout()
        }
    }
    
}
