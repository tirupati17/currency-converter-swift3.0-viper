//
//  AppDelegateTests.swift
//  CurrencyConverterTests
//
//  Created by Tirupati Balan on 25/03/19.
//  Copyright © 2019 CelerStudio. All rights reserved.
//

import Foundation
import XCTest
@testable import CurrencyConverter

class AppDelegateTests : XCTestCase {
    var appDelegate: AppDelegate = AppDelegate()
    var window: UIWindow? = UIWindow()
    
    override func setUp() {
        super.setUp()
        appDelegate.window = window
    }
    
    override func tearDown() {
        super.tearDown()
        window = nil
    }
    
    // MARK: Test after init
    
    func testThatHasAppDependenciesAfterInit() {
        XCTAssertNotNil(appDelegate.appDependencies, "should have a appDependencies after being initialized")
    }
    
    // MARK: Test after application launch
    
    func testWindowIsKeyAfterApplicationLaunch() {
        let mainAppDelegate = UIApplication.shared.delegate
        
        if let mainAppDelegate = mainAppDelegate {
            if let window = mainAppDelegate.window {
                if let window = window {
                    XCTAssertTrue(window.isKeyWindow)
                }
                else {
                    XCTFail("app delegate window should not be nil")
                }
            } else {
                XCTFail("app delegate window should not be nil")
            }
        }
        else {
            XCTFail("shared application should have a delegate")
        }
    }
    
    func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
        XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil), "should return true from didFinishLaunchingWithOptions")
    }
}
