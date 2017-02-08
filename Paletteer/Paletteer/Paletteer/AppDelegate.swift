//
//  AppDelegate.swift
//  Paletteer
//
//  Created by u0939404 on 2/8/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITableViewDataSource {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        window?.rootViewController?.view.backgroundColor = UIColor.darkGray
        
        let colorTableView: UITableView = UITableView(frame: window!.rootViewController!.view.bounds)
        colorTableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight] // bitwise or
        colorTableView.dataSource = self
        window?.rootViewController?.view.addSubview(colorTableView)
        
        
        
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Hello from cell \(indexPath.row)"
        cell.backgroundColor = colorForIndex(indexPath.row)
        
        //cell.contentView.addSubview(someView)
        
        return cell
    }
    
    func colorForIndex(_ index: Int) -> UIColor
    {
        return UIColor(hue: CGFloat(Double(index) / 100.0), saturation: 1.0, brightness: 1.0, alpha: 1.0)
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

