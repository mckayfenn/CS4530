//
//  Painting.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class Painting: UIView {
    var lines: [Line]
    var cellLines: [CellLine]
    
    override init(frame: CGRect) {
        
        lines = [Line]()
        cellLines = [CellLine]()
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLine(line: Line) {
        lines.append(line)
    }
    
    func addCellLine(cellLine: CellLine) {
        cellLines.append(cellLine)
    }
}

class Line {
    var points: [CGPoint] = []
    var color: UIColor = UIColor.white
    var width: CGFloat = 1.0
    var cap: CGLineCap = .butt
    var join: CGLineJoin = .miter
    var aspectRatio: CGFloat = 1.777777
    func addPoint(point: CGPoint) {
        points.append(point)
    }
    
}

class CellLine {
    var points: [CGPoint] = []
    var color: UIColor = UIColor.white
    var width: CGFloat = 1.0
    var cap: CGLineCap = .butt
    var join: CGLineJoin = .miter
    func addPoint(point: CGPoint) {
        points.append(point)
    }
}
