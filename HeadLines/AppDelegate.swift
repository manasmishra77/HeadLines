//
//  AppDelegate.swift
//  HeadLines
//
//  Created by Manas Mishra on 23/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CoreDataStack.sharedInstance.applicationDocumentsDirectory()
        self.setRootVC()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        CoreDataStack.sharedInstance.saveContext()
    }
    

}

extension AppDelegate {
    func setRootVC() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = HeadLinesViewController()
        self.window?.rootViewController = rootVC
    }
}
