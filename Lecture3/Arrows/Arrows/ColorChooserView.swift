//
//  ColorChooserView.swift
//  Arrows
//
//  Created by u0939404 on 2/1/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit
class ColorChooserView: UIView {
    
    private var _knobViewRed: KnobView? = nil
    private var _knobViewGreen: KnobView? = nil
    private var _knobViewBlue: KnobView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Construct all three of the knob views
        _knobViewRed = KnobView()
        _knobViewRed?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        _knobViewRed?.backgroundColor = UIColor.red
        addSubview(_knobViewRed!)
        
        
        _knobViewGreen = KnobView()
        _knobViewGreen?.frame = CGRect(x: 200.0, y: 200.0, width: 300.0, height: 400.0)
        _knobViewGreen?.backgroundColor = UIColor.green
        addSubview(_knobViewGreen!)
        
        
        _knobViewBlue = KnobView()
        _knobViewBlue?.frame = CGRect(x:300.0, y: 500.0, width: 300.0, height: 400.0)
        _knobViewBlue?.backgroundColor = UIColor.blue
        addSubview(_knobViewBlue!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var knobViewRed: KnobView? { return _knobViewRed }
    var knobViewGreen: KnobView? { return _knobViewGreen }
    var knobViewBlue: KnobView? { return _knobViewBlue }
    
    override func layoutSubviews() {
        super.layoutSubviews() // call the superclasses implementation, plays nicely with other layout methods
        
        // TODO: Assign frames to each subview
        var r: CGRect = bounds
        (_knobViewRed!.frame, r) = r.divided(atDistance: r.width * 0.25, from: .minXEdge)  // (frame, _) _ means don't do anything with remainder
        (_knobViewGreen!.frame, r) = r.divided(atDistance: r.width * 0.666, from: .minXEdge)
        (_knobViewBlue!.frame, r) = r.divided(atDistance: r.width * 1.0, from: .minXEdge)
    }
}
