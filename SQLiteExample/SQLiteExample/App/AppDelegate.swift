//
//  AppDelegate.swift
//  SQLiteExample
//
//  Created by David Sobeski on 6/12/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Proroperties
    
    var window: UIWindow?
    var dbManager: DatabaseManager!
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - UIApplicationDelegate Methods
    
    //
    //  Override point for customization after application launch.
    //
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool
    {
        dbManager = DatabaseManager()        
        return true
    }
    
    //
    //  Sent when the application is about to move from active to inactive state. This can occur for
    //  certain types of temporary interruptions (such as an incoming phone call or SMS message) or
    //  when the user quits the application and it begins the transition to the background state.
    //
    //  Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES
    //  frame rates. Games should use this method to pause the game.
    //
    func applicationWillResignActive(application: UIApplication)
    {
    }
    
    //
    //  Use this method to release shared resources, save user data, invalidate timers, and store
    //  enough application state information to restore your application to its current state in case
    //  it is terminated later.
    //
    //  If your application supports background execution, this method is called instead of
    //  applicationWillTerminate: when the user quits.
    //
    func applicationDidEnterBackground(application: UIApplication)
    {
    }
    
    //
    //  Called as part of the transition from the background to the inactive state; here you can undo
    //  many of the changes made on entering the background.
    //
    func applicationWillEnterForeground(application: UIApplication)
    {
    }
    
    //
    //  Restart any tasks that were paused (or not yet started) while the application was inactive.
    //  If the application was previously in the background, optionally refresh the user interface.
    //
    func applicationDidBecomeActive(application: UIApplication)
    {
    }
    
    //
    //  Called when the application is about to terminate. Save data if appropriate. See also
    //  applicationDidEnterBackground:.
    //
    func applicationWillTerminate(application: UIApplication)
    {
    }
}