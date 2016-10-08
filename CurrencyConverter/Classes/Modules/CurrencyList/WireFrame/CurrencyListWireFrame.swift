//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

let CurrencyListViewIdentifier = "CurrencyListView"

class CurrencyListWireFrame: CurrencyListWireFrameProtocol
{
    var currencyListPresenter : CurrencyListPresenter?
    var converterPresenter : ConverterPresenter?

    var presentedViewController : UIViewController?

    func presentCurrencyListModule(fromView view: UIViewController) {
        // Generating module components
        let currencyListView = currencyListViewFromStoryboard()
        
        currencyListView.presenter = currencyListPresenter
        currencyListPresenter?.view = currencyListView
        
        view.present(currencyListView, animated: true) { 
            
        };
        presentedViewController = view
    }
    
    func dismissCurrencyListWithSelectedData(_ converterItem : CurrencyListItem) {
        presentedViewController?.dismiss(animated: true, completion: { 
            self.converterPresenter?.initWithBaseConverterItem(ConverterItem(currencyName: converterItem.currencyName, country: converterItem.country, code: converterItem.code, symbol: converterItem.symbol, amount: "1"))
        })
    }
    
    func currencyListViewFromStoryboard() -> CurrencyListView {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: CurrencyListViewIdentifier) as! CurrencyListView
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
