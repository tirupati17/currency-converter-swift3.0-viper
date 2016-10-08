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
                let object = currency as? [String:Any]
                let currencyListItem = CurrencyListItem(currencyName: object!["name"] as! String ,
                                                        country: object!["country"] as! String,
                                                        code: object!["code"] as! String,
                                                        symbol: object!["symbol"] as! String)
                currencyListItems.append(currencyListItem)
            }
        }
        self.presenter?.fetchedCurrencyList(currencyListItems)
    }
}
