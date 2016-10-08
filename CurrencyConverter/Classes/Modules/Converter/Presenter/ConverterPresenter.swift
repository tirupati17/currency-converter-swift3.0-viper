//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ConverterPresenter: ConverterPresenterProtocol, ConverterInteractorOutputProtocol
{
    weak var view: ConverterViewProtocol?
    var interactor: ConverterInteractorInputProtocol?
    var wireFrame: ConverterWireFrameProtocol?
    
    init() {}
    
    /**
     * Methods for communication VIEW -> PRESENTER
     */
    
    func showCurrencyListView() {
        self.wireFrame?.showCurrencyListViewController()
    }

    func loadView() {
        self.interactor?.initWithBaseCurrencyAndLoad()
    }

    func getCurrencyListWithData(_ baseConverterItem: ConverterItem) {
        self.interactor?.getCurrencyWithData(baseConverterItem)
    }
    
    /**
     * Methods for communication INTERACTOR -> PRESENTER
     */
    
    func initWithBaseConverterItem(_ converterItem: ConverterItem) {
        self.view?.initWithBaseAndReload(currencyName: converterItem.currencyName, country: converterItem.country, code: converterItem.code, symbol: converterItem.symbol, amount: converterItem.amount)
    }

    func fetchedConvertedCurrency(_ convertedCurrency:[ConverterItem]) {
        if convertedCurrency.count == 0 {
            self.view?.noContentFromServer()
        } else {
            self.view?.reloadTableViewWithData(convertedCurrency)
        }
    }
}
