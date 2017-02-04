//
//  StrokeWidthView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeWidthView: UIControl {
    private var _width: UISlider?
    
    override func draw(_ rect: CGRect) {
        _width = UISlider(frame: CGRect(x: 10.0, y: 250.0, width: bounds.size.width / 0.9, height: 20.0))
        _width!.minimumValue = 0.5
        _width!.maximumValue = 50.0
    }
}
