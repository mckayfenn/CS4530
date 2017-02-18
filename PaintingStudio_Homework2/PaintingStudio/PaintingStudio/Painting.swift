//
//  Painting.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import Foundation

class Painting {
    var strokes: [Stroke] = []
    var aspectRatio: Double = 1.0
}

class Stroke {
    var color: Color = Color
    var points: [Point] = []
    var width: Double = 1.0
}

class Color {
    var red: Double = 1.0
    var green: Double = 1.0
    var blue: Double = 1.0
}

class Point {
    var x: Double = 1.0
    var y: Double = 1.0
}
