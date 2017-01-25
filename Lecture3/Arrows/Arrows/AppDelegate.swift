//
//  AppDelegate.swift
//  Arrows
//
//  Created by u0939404 on 1/18/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        //let vectorView: VectorView = VectorView(frame: CGRect(x: 10.0, y: 20.0, width: 300.0, height: 300.0))
        //vectorView.vectors = [Vector(px:100.0, py:200.0), Vector(px:200.0, py:200.0)]
        //vectorView.backgroundColor = UIColor.lightGray
        //window?.rootViewController?.view.addSubview(vectorView)
        
        let knobView: KnobView = KnobView()
        knobView.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        knobView.backgroundColor = UIColor.green
        window?.rootViewController?.view.addSubview(knobView)
        
        return true
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

