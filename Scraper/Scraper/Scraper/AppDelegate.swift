//
//  AppDelegate.swift
//  Scraper
//
//  Created by u0939404 on 3/20/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let networkQueue: OperationQueue = OperationQueue()
        
        networkQueue.addOperation({
        
        
            let url: URL = URL(string: "http://www.nytimes.com")!
            var content: NSString = try! NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue) // this is very slow, needs to be on a thread
            //NSLog("Received response data: \(content)")
            
            var imageUrls: [URL] = []
            while (content.length > 0) {
                
                let imageTagStart: NSRange = content.range(of: "<img src=\"")
                if imageTagStart.location == NSNotFound {
                    content = ""
                }
                else {
                    content = content.substring(from: imageTagStart.location + imageTagStart.length) as NSString
                    
                    let imageTagEnd: NSRange = content.range(of: "\"")
                    if imageTagEnd.location != NSNotFound {
                        let imageURLString: String = content.substring(to: imageTagEnd.location)
                        let imageURL: URL? = URL(string: imageURLString)
                        if imageURL != nil {
                            NSLog("Found Image URL: \(imageURLString)")
                            imageUrls.append(imageURL!)
                        }
                    }
                }
                
                
            }
            
            NSLog("Found \(imageUrls.count) Image URLS")
            
            for imageUrl: URL in imageUrls {
                
                let imageData: NSData? = NSData(contentsOf: imageUrl)  // this is very slow needs to be on a thread
                if imageData != nil {
                    NSLog("Downloaded data of size: \(imageData?.length)")
                    let image: UIImage! = UIImage(data: imageData as! Data)
                    if image != nil {
                        NSLog("Downloaded image of size: [\(image.size.width)x\(image.size.height)]")
                    }
                    
                }
            }
        
        
        })
        
        
        
        
        
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

