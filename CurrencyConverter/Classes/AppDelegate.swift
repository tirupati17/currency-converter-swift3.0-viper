//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Tirupati Balan on 28/09/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

import UIKit
@_exported import Appirater
@_exported import Mixpanel
@_exported import UserExperior
@_exported import Refresher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDependencies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appDependencies.installRootViewControllerIntoWindow(window!)
        self.defaultInitialization()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
    
    func defaultInitialization() {
        UserExperior.initialize("047ba342-d504-427e-9718-f9b006c22e37")
        Mixpanel.initialize(token:"043e30da77767f24cd686e4a3d6efab9")
        Appirater.setAppId("1163490933")
    }
}

