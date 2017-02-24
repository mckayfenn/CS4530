//
//  PaintingView.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/21/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class CellView: UIView {
    var painting: Painting = Painting()
    var context: CGContext? = nil
    
    private var _preview: CGRect = CGRect.zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func draw(_ rect: CGRect) {
        _preview = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.height)
        context = UIGraphicsGetCurrentContext()!
        
        context?.clear(_preview)
        
        for cellLine in painting.cellLines {
            for point in cellLine.points {
                if (point.equalTo(cellLine.points.first!)) {
                    context?.move(to: point)
                }
                else {
                    context?.addLine(to: point)
                }
            }
            context?.setStrokeColor(cellLine.color.cgColor)
            context?.setLineWidth(cellLine.width)
            context?.setLineCap(cellLine.cap)
            context?.setLineJoin(cellLine.join)
            context?.drawPath(using: .stroke)
        }
        
    }
    

    
    
    
    var _width: CGFloat = 1.0
    var _color: UIColor = UIColor.white
    var _cap: CGLineCap = .butt
    var _join: CGLineJoin = .miter
    
    
}
