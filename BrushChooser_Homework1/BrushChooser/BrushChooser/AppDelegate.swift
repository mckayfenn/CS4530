//
//  AppDelegate.swift
//  BrushChooser
//
//  Created by u0939404 on 2/3/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var _brushChooser: BrushChooser? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        _brushChooser = BrushChooser(frame: UIScreen.main.bounds)
        window?.rootViewController?.view.addSubview(_brushChooser!)
        
        _brushChooser?.colorWheel?.addTarget(self, action: #selector(knobChanged), for: UIControlEvents.valueChanged)
        
        _brushChooser?.endCap?.addTarget(self, action: #selector(buttButton), for: UIControlEvents.touchDown)
        
        _brushChooser?.strokeWidth?.widthSlider.addTarget(self, action: #selector(widthChanged), for: UIControlEvents.valueChanged)
        
        _brushChooser?.strokeJoin?.addTarget(self, action: #selector(joinSelected), for: UIControlEvents.touchDown)
        return true
    }
    
    func knobChanged() {
        //NSLog("Changed to: \(_brushChooser?.colorWheel?.angle)")
        _brushChooser?.preview?.color = (_brushChooser?.colorWheel?.color)!
    }
    
    func buttButton() {
        //NSLog(".butt selected in app delegate")
        let point = Float((_brushChooser?.endCap?.touchPoint.x)!)
        let buttX = Float((_brushChooser?.endCap?.buttButton?.maxX)!)
        let roundX = Float((_brushChooser?.endCap?.roundButton?.maxX)!)
        let squareX = Float((_brushChooser?.endCap?.squareButton?.maxX)!)
        
        if (point < buttX)
        {
            NSLog(".butt selected")
            _brushChooser?.preview?.capState = CGLineCap.butt
        }
        else if (point < roundX)
        {
            NSLog(".round selected")
            _brushChooser?.preview?.capState = CGLineCap.round
        }
        else if (point < squareX)
        {
            NSLog(".square selected")
            _brushChooser?.preview?.capState = CGLineCap.square
        }
        
    }
    
    func joinSelected()
    {
        let point = Float((_brushChooser?.strokeJoin?.touchPoint.x)!)
        let miterX = Float((_brushChooser?.strokeJoin?.miterJoin?.maxX)!)
        let roundX = Float((_brushChooser?.strokeJoin?.roundJoin?.maxX)!)
        let bevelX = Float((_brushChooser?.strokeJoin?.bevelJoin?.maxX)!)
        
        if (point < miterX)
        {
            NSLog(".miterJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.miter
        }
        else if (point < roundX)
        {
            NSLog(".roundJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.round
        }
        else if (point < bevelX)
        {
            NSLog(".bevelJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.bevel
        }
    }
    
    func widthChanged()
    {
        NSLog("Width changed")
        _brushChooser?.preview?.width = CGFloat((_brushChooser?.strokeWidth?.widthSlider.value)!)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

