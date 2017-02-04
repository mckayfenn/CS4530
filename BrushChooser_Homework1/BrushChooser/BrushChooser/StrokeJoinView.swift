//
//  StrokeJoinView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeJoinView: UIControl {
    private var _join: CGRect = CGRect.zero
    
    override func draw(_ rect: CGRect) {
        _join = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.height)
        
        // draw two lines with a join
    }
}
