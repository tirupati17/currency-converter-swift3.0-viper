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
        let rootWireframe = RootWireframe()
        let currencyListWireFrame = CurrencyListWireFrame()
        
        // Converter
        let converterPresenter = ConverterPresenter()
        let converterAPIDataManager = ConverterAPIDataManager()
        let converterIntractor = ConverterInteractor()
        
        converterIntractor.presenter = converterPresenter
        converterIntractor.APIDataManager = converterAPIDataManager
        
        converterPresenter.interactor = converterIntractor
        converterPresenter.wireFrame = converterWireFrame
        
        converterWireFrame.rootWireframe = rootWireframe
        converterWireFrame.currencyListWireFrame = currencyListWireFrame
        converterWireFrame.presenter = converterPresenter
 
        // CurrencyList
        let currencyListPresenter = CurrencyListPresenter()
        let currencyListAPIDataManager = CurrencyListAPIDataManager()
        let currencyListInteractor = CurrencyListInteractor()

        currencyListInteractor.presenter = currencyListPresenter
        currencyListInteractor.APIDataManager = currencyListAPIDataManager
        
        currencyListPresenter.interactor = currencyListInteractor
        currencyListPresenter.wireFrame = currencyListWireFrame
 
        currencyListWireFrame.currencyListPresenter = currencyListPresenter
        currencyListWireFrame.converterPresenter = converterPresenter
    }
}
