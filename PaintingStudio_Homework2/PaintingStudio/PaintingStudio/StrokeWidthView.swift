//
//  StrokeWidthView.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class StrokeWidthView: UIView {
    private var _widthSlider: UISlider = UISlider()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _widthSlider = UISlider(frame: CGRect(x: bounds.minX+10 , y: bounds.minY, width: 300.0, height: 50.0))
        _widthSlider.minimumValue = 1
        _widthSlider.maximumValue = 50.0
        
        addSubview(_widthSlider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var widthSlider: UISlider { return _widthSlider }
    
}
