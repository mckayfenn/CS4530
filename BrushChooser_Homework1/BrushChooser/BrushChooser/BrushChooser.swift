//
//  ColorChooserView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

/// BrushChooser is the whole overall view
class BrushChooser: UIView {
    
    private var _colorWheel: ColorWheelView? = nil
//    private var _strokeEndCap: StrokeEndCapView? = nil
//    private var _strokeWidth: StrokeWidthView? = nil
//    private var _strokeJoin: StrokeJoinView? = nil
//    private var _brushPreview: BrushPreviewView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Construct all the subviews
        _colorWheel = ColorWheelView()
        _colorWheel?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 300.0)
        _colorWheel?.backgroundColor = UIColor.white
        addSubview(_colorWheel!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colorWheel: ColorWheelView? { return _colorWheel }
    
    override func layoutSubviews() {
        super.layoutSubviews() // call the superclasses implementaition, plays nicely with other layouts
        
        // TODO: Assign frames to each subview
        var r: CGRect = bounds
        (_colorWheel!.frame, r) = r.divided(atDistance: r.width, from: .minXEdge)
    }
}
