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
            if ((currency as? NSDictionary) != nil) {
                let currencyName = currency as? [String:Any]
                let country = currency as? [String:Any]
                let code = currency as? [String:Any]
                let symbol = currency as? [String:Any]

                let currencyListItem = CurrencyListItem(currencyName: currencyName!["currencyName"] as! String ,
                                                        country: country!["country"] as! String,
                                                        code: code!["code"] as! String,
                                                        symbol: symbol!["symbol"] as! String)
                currencyListItems.append(currencyListItem)
            }
        }
        self.presenter?.fetchedCurrencyList(currencyListItems)
    }
}
