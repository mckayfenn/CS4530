//
//  Painting.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class Painting: UIView {
    //var strokes: [Stroke] = []
    //var aspectRatio: Double = 1.0
    var points: [CGPoint] = []
    var color: UIColor?
    var width: CGFloat = 0.0
    var cap: CGLineCap?
    var join: CGLineJoin?
    
    func addPoint(point: CGPoint) {
        points.append(point)
    }
}

class Stroke {
    var color: Color?
    var points: [Point] = []
    var width: Double = 1.0
}

class Color {
    var red: Double = 255.0
    var green: Double = 255.0
    var blue: Double = 255.0
    
    init(r: Double, g: Double, b: Double) {
        red = r
        green = g
        blue = b
    }
}

class Point {
    var x: Double = 1.0
    var y: Double = 1.0
}
