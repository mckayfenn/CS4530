//
//  AmpView.swift
//  Amp
//
//  Created by u0939404 on 2/27/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class AmpView: UIView {
    
    private var _volumeKnob: KnobView! = nil
    private var _bassKnob: KnobView! = nil
    // TODO: More knobs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _volumeKnob = KnobView()
        _volumeKnob.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_volumeKnob)
        
        _bassKnob = KnobView()
        _bassKnob.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_bassKnob)
        
        let views: [String:UIView] = ["volume":_volumeKnob, "bass":_bassKnob]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[volume]-[bass]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[volume]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[bass]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        // make the width of volume and bass knobs equal
        addConstraint(NSLayoutConstraint(item: _volumeKnob, attribute: .width, relatedBy: .equal, toItem: _bassKnob, attribute: .width, multiplier: 1.0, constant: 0.0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var volumeKnob: KnobView {
        return _volumeKnob
    }
    
    var bassKnob: KnobView {
        return _bassKnob
    }
}
