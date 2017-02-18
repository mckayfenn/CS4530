//
//  PaintingViewController.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController {
    var labelView: UILabel {
        return view as! UILabel
    }
    
    override func loadView() {
        view = UILabel()
    }
    
    override func viewDidLoad() {
        labelView.textAlignment = NSTextAlignment.center
        labelView.backgroundColor = UIColor.white
        labelView.numberOfLines = -1
    }
    
    var painting: Painting? {
        didSet {
            // Load painting into view
        }
    }
}
