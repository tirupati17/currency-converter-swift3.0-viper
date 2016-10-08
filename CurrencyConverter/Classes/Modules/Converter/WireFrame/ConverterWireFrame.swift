//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

let ConverterViewIdentifier = "ConverterView"

class ConverterWireFrame: ConverterWireFrameProtocol
{
    var rootWireframe : RootWireframe?
    var converterView : ConverterView?
    var currencyListWireFrame : CurrencyListWireFrame?
    var presenter: ConverterPresenterProtocol & ConverterInteractorOutputProtocol = ConverterPresenter()
    
    func presentConverterModule(fromView window: AnyObject) {
        let view = converterViewFromStoryboard()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view

        converterView = view
        rootWireframe?.showRootViewController(view, inWindow: window as! UIWindow)
    }
    
    func showCurrencyListViewController() {
        self.currencyListWireFrame?.presentCurrencyListModule(fromView: converterView!)
    }
    
    func converterViewFromStoryboard() -> ConverterView {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: ConverterViewIdentifier) as! ConverterView
        return viewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
