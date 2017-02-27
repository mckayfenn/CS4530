//
//  AmpViewController.swift
//  Amp
//
//  Created by u0939404 on 2/27/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class AmpViewController: UIViewController {

    override func loadView() {
        view = AmpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        
        ampView.volumeKnob.valueChangedHandler = {
            [weak self] in  // A owns B, but B only weakly owns A
            NSLog("Volume Changed: \(self?.ampView.volumeKnob.angle)")
        }
        
        ampView.bassKnob.valueChangedHandler = {
            [weak self] in  // A owns B, but B only weakly owns A
            NSLog("Bass Changed: \(self?.ampView.bassKnob.angle)")
        }
        
        //ampView.volumeKnob.addTarget(self, action: #selector(volumeChanged), for: .valueChanged)
        //ampView.bassKnob.addTarget(self, action: #selector(bassChanged), for: .valueChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var ampView: AmpView {
        return view as! AmpView
    }
    
//    func volumeChanged() {
//        // TODO: Angle -> Volume conversion
//        NSLog("Volume Changed: \(ampView.volumeKnob.angle)")
//    }
//    func bassChanged() {
//        // TODO: Angle -> bass conversion
//        NSLog("Bass Changed: \(ampView.bassKnob.angle)")
//    }
}

