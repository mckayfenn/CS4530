//
//  Vector.swift
//  Arrows
//
//  Created by u0939404 on 1/18/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import Foundation

public class Vector {
    var x: Float
    var y: Float
    
    init(px: Float, py: Float) {
        x = px
        y = py
    }
    
    func calculateMagnitude() -> Float {
        return sqrt(x * x + y * y)
    }
    
    var magnitude: Float {
        get { return sqrt(x * x + y * y) }
        set {
            let m = magnitude
            x /= m
            y /= m
            x *= newValue
            y *= newValue
        }
    }
    
    var direction: Float {
        // TODO: this
        return 0.0
    }
    
    func add(v: Vector) {
        x += v.x
        y += v.y
    }
    
    func scale(v: Vector, s: Float) -> Vector {
        return Vector(px: v.x * s, py: v.y * s)
    }
}

func add(v1: Vector, v2: Vector) -> Vector {
    return Vector(px: v1.x + v2.x, py: v1.y + v2.y)
}

func scale(v: Vector, s: Float) -> Vector {
    return Vector(px: v.x * s, py: v.y * s)
}
