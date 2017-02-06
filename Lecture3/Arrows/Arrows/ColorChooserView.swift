//
//  ColorChooserView.swift
//  Arrows
//
//  Created by u0939404 on 2/1/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit
class ColorChooserView: UIView {
    
    private var _knobViewRed: KnobView! = nil
    private var _knobViewGreen: KnobView! = nil
    private var _knobViewBlue: KnobView! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let stackView: UIStackView = UIStackView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
//        stackView.axis = UILayoutConstraintAxis.horizontal
//        stackView.distribution = UIStackViewDistribution.fillEqually
//        stackView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight] // bitwise OR
//        addSubview(stackView)
//        
//        
//        
//        
//        
//        // trying stuff out with more stackviews
//        let subStack1: UIStackView = UIStackView()
//        subStack1.axis = UILayoutConstraintAxis.vertical
//        subStack1.distribution = UIStackViewDistribution.fillEqually
//        stackView.addArrangedSubview(subStack1)
        
        
        // Construct all three of the knob views
        _knobViewRed = KnobView()
        _knobViewRed?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        _knobViewRed?.backgroundColor = UIColor.red
        _knobViewRed?.contentMode = UIViewContentMode.redraw
        _knobViewRed?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_knobViewRed!)         // done with the layoutSubviews
        //subStack1.addArrangedSubview(_knobViewRed!) // done with stackview
        
        
        _knobViewGreen = KnobView()
        _knobViewGreen?.frame = CGRect(x: 200.0, y: 200.0, width: 300.0, height: 400.0)
        _knobViewGreen?.backgroundColor = UIColor.green
        _knobViewGreen?.contentMode = UIViewContentMode.redraw
        _knobViewGreen?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_knobViewGreen!)
        //subStack1.addArrangedSubview(_knobViewGreen!)
        
        
        _knobViewBlue = KnobView()
        _knobViewBlue?.frame = CGRect(x:300.0, y: 500.0, width: 300.0, height: 400.0)
        _knobViewBlue?.backgroundColor = UIColor.blue
        _knobViewBlue?.contentMode = UIViewContentMode.redraw
        _knobViewBlue?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_knobViewBlue!)
        //subStack1.addArrangedSubview(_knobViewBlue!)

        addConstraint(NSLayoutConstraint(item: _knobViewRed!, attribute: .width, relatedBy: NSLayoutRelation.equal, toItem: _knobViewGreen!, attribute: .width, multiplier: 1.0, constant: 0.0))
        
        
        let views: [String:UIView] = ["red":_knobViewRed, "green":_knobViewGreen, "blue":_knobViewBlue]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[red]-[green]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[red]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
//        let subStack2: UIStackView = UIStackView()
//        subStack2.axis = UILayoutConstraintAxis.vertical
//        subStack2.distribution = UIStackViewDistribution.fillEqually
//        stackView.addArrangedSubview(subStack2)
//        
//        let redView: UIView = UIView()
//        redView.backgroundColor = UIColor.red
//        subStack2.addArrangedSubview(redView)
//        
//        let brownView: UIView = UIView()
//        brownView.backgroundColor = UIColor.brown
//        subStack2.addArrangedSubview(brownView)
//
//        let subStack3: UIStackView = UIStackView()
//        subStack3.axis = UILayoutConstraintAxis.vertical
//        subStack3.distribution = UIStackViewDistribution.fillEqually
//        stackView.addArrangedSubview(subStack3)
//
//        let orangeView: UIView = UIView()
//        orangeView.backgroundColor = UIColor.orange
//        subStack3.addArrangedSubview(orangeView)
//        
//        let purpleView: UIView = UIView()
//        purpleView.backgroundColor = UIColor.purple
//        subStack3.addArrangedSubview(purpleView)
//        
//        let cyanView: UIView = UIView()
//        cyanView.backgroundColor = UIColor.cyan
//        subStack3.addArrangedSubview(cyanView)
//        
//        let magentaView: UIView = UIView()
//        magentaView.backgroundColor = UIColor.magenta
//        subStack3.addArrangedSubview(magentaView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var knobViewRed: KnobView? { return _knobViewRed }
    var knobViewGreen: KnobView? { return _knobViewGreen }
    var knobViewBlue: KnobView? { return _knobViewBlue }
    
//    override func layoutSubviews() {
//        super.layoutSubviews() // call the superclasses implementation, plays nicely with other layout methods
//        
//        // TODO: Assign frames to each subview
//        var r: CGRect = bounds
//        (_knobViewRed!.frame, r) = r.divided(atDistance: r.width * 0.25, from: .minXEdge)  // (frame, _) _ means don't do anything with remainder
//        (_knobViewGreen!.frame, r) = r.divided(atDistance: r.width * 0.666, from: .minXEdge)
//        (_knobViewBlue!.frame, r) = r.divided(atDistance: r.width * 1.0, from: .minXEdge)
//    }
}
