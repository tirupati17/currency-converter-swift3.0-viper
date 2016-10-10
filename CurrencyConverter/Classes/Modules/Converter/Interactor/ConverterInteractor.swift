//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import SwiftyJSON

class ConverterInteractor: ConverterInteractorInputProtocol
{
    weak var presenter: ConverterInteractorOutputProtocol?
    var APIDataManager: ConverterAPIDataManagerInputProtocol?
    var localDatamanager: ConverterLocalDataManagerInputProtocol?
    
    init() {}
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
    
    func initWithBaseCurrencyAndLoad() {
        let converterItem = ConverterItem(currencyName: "United States Dollar", country: "United States of America", code: "USD", symbol: "$", amount: "1")
        self.presenter?.initWithBaseConverterItem(converterItem)
    }

    func getCurrencyWithData(_ baseConverterItemObject: ConverterItem) {
        var baseConverterItem = baseConverterItemObject
        if baseConverterItem.isFreshLoad == true {
            self.APIDataManager?.fetchCurrencyFromServerWithData(baseConverterItem.code,
                                                                 completion:
                { response in
                    var exchangeData = response as! SwiftyJSON.JSON
                    var converterItems = [ConverterItem]()
                    
                    let path = Bundle.main.path(forResource: "CountryData", ofType: "plist")
                    let listArray = NSArray(contentsOfFile: path!) as NSArray!
                    
                    for (key, value) in exchangeData["rates"] {
                        let filteredCountryData = listArray?.filtered(using: NSPredicate(format : "code = %@", key))
                        for filteredCountryDataObject in filteredCountryData! {
                            let object = filteredCountryDataObject as? [String:Any]
                            let converterItem = ConverterItem(currencyName: object!["name"] as! String, country: object!["country"] as! String, code: key, symbol: object!["symbol"] as! String, amount: value.stringValue)
                            converterItems.append(converterItem)
                        }
                    }
                    baseConverterItem.convertedList = converterItems
                    self.presenter?.fetchedConvertedCurrency(self.returnConverterItemsWithBaseConverter(baseConverterItem: baseConverterItem))
                },
                                                                 failed:
                { error in //if you want to show error message as per server
                    self.presenter?.fetchedConvertedCurrency([]) // for now sending empty collection of ConverterItem to presenter
                }
            )
        } else {
            self.presenter?.fetchedConvertedCurrency(self.returnConverterItemsWithBaseConverter(baseConverterItem: baseConverterItem))
        }
    }
    
    func returnConverterItemsWithBaseConverter(baseConverterItem : ConverterItem) -> [ConverterItem] {
        var baseAmount = baseConverterItem.amount
        if (baseConverterItem.amount.isEmpty || Double(baseConverterItem.amount) == 0 || Double(baseConverterItem.amount) == nil) {
            baseAmount = "1"
        } else {
            baseAmount = baseConverterItem.amount.replacingOccurrences(of: ",", with: "")
        }
        
        var convertedList = baseConverterItem.convertedList
        
        for i in stride(from: 0, to: convertedList.count, by: 1) {
            var converterItem = convertedList[i] as ConverterItem
            let convertedAmount = Double(baseAmount)! * Double(converterItem.amount)!
            converterItem.convertedAmount = NSString (format : "%.4f", Double(convertedAmount)) as String
            
            convertedList[i] = converterItem
        }
        return convertedList
    }
}
