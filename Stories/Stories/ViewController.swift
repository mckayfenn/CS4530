//
//  ViewController.swift
//  Stories
//
//  Created by u0939404 on 4/12/17.
//  Copyright © 2017 u0939404. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tellStory(_ sender: Any) {
        storyLabel.text = "Tell a story"
    }

}

