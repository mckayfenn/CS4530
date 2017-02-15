//
//  ColorViewController.swift
//  Paletteer
//
//  Created by u0939404 on 2/15/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    override func loadView() {
        view = UILabel()
    }
    
    private var labelView: UILabel {
        return view as! UILabel
    }
    
    override func viewDidLoad() {
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.systemFont(ofSize: 30.0)
        
        
    }
    
    var color: UIColor = UIColor.black {
        didSet {
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            
            //labelView.text = String.localizedStringWithFormat("#%02X%02X%02X", red * 255, green * 255, blue * 255)
            labelView.text = "R:\(red * 255.0) G:\(green * 255.0) B:\(blue * 255.0)"
            labelView.backgroundColor = color
            labelView.textColor = UIColor.black // lightColor ? UIColor.black : UIColor.white
        }
    }
}
