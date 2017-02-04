//
//  BrushPreviewView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class BrushPreviewView:UIControl {
    
    private var _preview: CGRect = CGRect.zero
    
    override func draw(_ rect: CGRect) {
        _preview = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.width)
        
        // draw a line with all the updates from the inputs
    }
}
