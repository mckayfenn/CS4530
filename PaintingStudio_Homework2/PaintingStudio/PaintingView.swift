//
//  PaintingView.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/21/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingView {
    var lines: [PolyLines] = []
    
}

class PolyLines {
    var points: [CGPoint] = []
    var cap: CGLineCap = .butt
    var width: CGFloat = 0.0
    var color: UIColor = UIColor.black
}
