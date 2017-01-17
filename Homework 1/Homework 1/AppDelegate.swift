//
//  AppDelegate.swift
//  Homework 1
//
//  Created by u0939404 on 1/13/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var _X: UILabel?
    var _Y: UILabel?
    var _XValue: UILabel?
    var _YValue: UILabel?
    
    var _XPlusY: UILabel?
    var _XMultY: UILabel?
    
    var _XSlider: UISlider?
    var _YSlider: UISlider?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.rootViewController?.view.backgroundColor = UIColor.lightGrayColor()
        window?.makeKeyAndVisible()
        
        // Set up sliders
        _XSlider = UISlider(frame: CGRectMake(60, 175, 175, 20))
        _XSlider!.minimumValue = 0.0
        _XSlider!.maximumValue = 1.0
        _XSlider!.addTarget(self, action: #selector(AppDelegate.sliderChanged)
            , forControlEvents: UIControlEvents.ValueChanged)
        window!.addSubview(_XSlider!)
        
        _YSlider = UISlider(frame: CGRectMake(60, 225, 175, 20))
        _YSlider!.minimumValue = 0.0
        _YSlider!.maximumValue = 1.0
        _YSlider!.addTarget(self, action: #selector(AppDelegate.sliderChanged), forControlEvents: UIControlEvents.ValueChanged)
        window!.addSubview(_YSlider!)
        
        // Set up all labels
        _X = UILabel(frame: CGRectMake(40, 175, 10, 20))
        _X!.text = "X"
        window!.addSubview(_X!)
        
        _XValue = UILabel(frame: CGRectMake(250, 175, 100, 20))
        _XValue!.text = String(format: "%.3f", _XSlider!.value)
        window!.addSubview(_XValue!)
        
        _Y = UILabel(frame: CGRectMake(40, 225, 10, 20))
        _Y!.text = "Y"
        window!.addSubview(_Y!)
        
        _YValue = UILabel(frame: CGRectMake(250, 225, 100, 20))
        _YValue!.text = String(format: "%.3f", _YSlider!.value)
        window!.addSubview(_YValue!)
        
        _XPlusY = UILabel(frame: CGRectMake(110, 275, 150, 20))
        _XPlusY!.text = "X + Y: " + String(format: "%.3f", _XSlider!.value)
        window!.addSubview(_XPlusY!)
        
        _XMultY = UILabel(frame: CGRectMake(110, 300, 150, 20))
        _XMultY!.text = "X * Y: " + String(format: "%.3f", _YSlider!.value)
        window!.addSubview(_XMultY!)
        
        
        return true
    }

    
    func sliderChanged()
    {
        let x = _XSlider!.value
        let y = _YSlider!.value
        
        
        // Update slider values
        _XValue!.text = String(format: "%.3f", x)
        _YValue!.text = String(format: "%.3f", y)
        
        // Do calculations
        let xPlusy = x + y
        let xMulty = x * y
        
        
        // Update calculations
        _XPlusY!.text = "X + Y: " + String(format: "%.3f", xPlusy)
        _XMultY!.text = "X * Y: " + String(format: "%.3f", xMulty)
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

