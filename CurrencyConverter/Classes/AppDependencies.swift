//
//  AppDependencies.swift
//  CurrencyConverter
//
//  Created by Tirupati Balan on 29/09/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var converterWireFrame = ConverterWireFrame()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        converterWireFrame.presentConverterModule(fromView: window)
    }
    
    func configureDependencies() {
        _ = RootWireframe()
        
        /*
        let converterPresenter = ConverterPresenter()
        let converterLocalDataManager = ConverterLocalDataManager()
        let converterIntractor = ConverterInteractor()
        
        converterIntractor.presenter = converterPresenter
        converterIntractor.localDatamanager = converterLocalDataManager
        
        converterPresenter.interactor = converterIntractor
        converterPresenter.wireFrame = converterWireFrame
        
        converterWireFrame.rootWireframe = rootWireframe
        converterWireFrame.converterPresenter = converterPresenter
        */
    }
}
