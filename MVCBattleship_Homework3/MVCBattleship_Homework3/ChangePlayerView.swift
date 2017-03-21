//
//  ChangePlayerView.swift
//  MVCBattleship_Homework3
//
//  Created by Cronus on 3/15/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class ChangePlayerView: UIViewController {
    
    private var labelView: UILabel {
        return view as! UILabel
    }
    
    
    override func loadView() {
        view = UILabel()
        
    }
    
    
    override func viewDidLoad() {
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.systemFont(ofSize: 15.0)
        
        labelView.text = "Pass the device to your opponent."
        labelView.backgroundColor = UIColor.white
    }
}
