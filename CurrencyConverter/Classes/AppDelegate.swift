//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Tirupati Balan on 28/09/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

import UIKit
import Appirater
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDependencies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
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
        Fabric.with([Crashlytics.self])
        Fabric.with([Answers.self])
        
        Appirater.setAppId("1163490933")
        Appirater.setDaysUntilPrompt(7)
        Appirater.setUsesUntilPrompt(5)
        Appirater.setSignificantEventsUntilPrompt(-1)
        Appirater.setTimeBeforeReminding(2)
        Appirater.setDebug(false)
        Appirater.appLaunched(true)
    }

}

