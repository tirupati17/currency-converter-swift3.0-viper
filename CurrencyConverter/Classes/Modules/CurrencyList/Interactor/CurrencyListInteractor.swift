//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class CurrencyListInteractor: CurrencyListInteractorInputProtocol
{
    weak var presenter: CurrencyListInteractorOutputProtocol?
    var APIDataManager: CurrencyListAPIDataManagerInputProtocol?
    var localDatamanager: CurrencyListLocalDataManagerInputProtocol?
    var currencyListLocalDataManager = CurrencyListLocalDataManager()
    
    init() {}
    
    func getCurrencyList() {
        let currencyListArray = self.currencyListLocalDataManager.loadCurrencyListArrayFromBundle()
        var currencyListItems = [CurrencyListItem]()
        for currency in currencyListArray {
            let currencyListItem = CurrencyListItem(currencyName: currency["name"] as! String, country: currency["country"] as! String, code: currency["code"] as! String, symbol: currency["symbol"] as! String)
            currencyListItems.append(currencyListItem)
        }
        self.presenter?.fetchedCurrencyList(currencyListItems)
    }
}