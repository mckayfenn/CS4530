//
//  ColorChooserView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

/// BrushChooser is the whole overall view
class BrushChooser: UIControl {
    
    private var _colorWheel: ColorWheelView? = nil
    private var _strokeEndCap: StrokeEndCapView? = nil
    private var _strokeWidth: StrokeWidthView? = nil
    private var _strokeJoin: StrokeJoinView? = nil
    private var _brushPreview: BrushPreviewView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Construct all the subviews
        _colorWheel = ColorWheelView()
        _colorWheel?.frame = CGRect(x: 10.0, y: 10.0, width: 250.0, height: 250.0)
        addSubview(_colorWheel!)
        
        _strokeEndCap = StrokeEndCapView()
        _strokeEndCap?.frame = CGRect(x: 10.0, y: 300.0, width: bounds.size.width, height: 50.0)
        addSubview(_strokeEndCap!)
        
        _strokeWidth = StrokeWidthView()
        _strokeWidth?.frame = CGRect(x: 10.0, y: 325.0, width: bounds.size.width, height: 50.0)
        addSubview(_strokeWidth!)
        
        _strokeJoin = StrokeJoinView()
        _strokeJoin?.frame = CGRect(x: 10.0, y: 350.0, width: bounds.size.width, height: 50.0)
        addSubview(_strokeJoin!)
        
        _brushPreview = BrushPreviewView()
        _brushPreview?.frame = CGRect(x: 10.0, y: 400.0, width: bounds.size.width, height: 50.0)
        addSubview(_brushPreview!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews() // call the superclasses implementaition, plays nicely with other layouts
        
        // TODO: Assign frames to each subview
        
        
        var r: CGRect = bounds
        (_colorWheel!.frame, r) = r.divided(atDistance: r.height * 0.5, from: .minYEdge)
        
        (_strokeEndCap!.frame, r) = r.divided(atDistance: r.height * 0.25, from: .minYEdge)
        
        (_strokeJoin!.frame, r) = r.divided(atDistance: r.height * 0.25, from: .minYEdge)
        
        (_strokeWidth!.frame, r) = r.divided(atDistance: r.height * 0.4, from: .minYEdge)
        
        (_brushPreview!.frame, r) = r.divided(atDistance: r.height, from: .minYEdge)
    }
    
    var buttButton: CGRect { return (_strokeEndCap?.buttButton)! }
    var colorWheel: ColorWheelView? { return _colorWheel }
    var endCap: StrokeEndCapView? { return _strokeEndCap }
    var strokeWidth: StrokeWidthView? { return _strokeWidth }
    var strokeJoin: StrokeJoinView? { return _strokeJoin }
    var preview: BrushPreviewView? { return _brushPreview }
}
