//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

struct CurrencyListItem
{
    var currencyName : String
    var country : String
    var code : String
    var symbol : String
    
    init(currencyName: String, country: String, code: String, symbol: String) {
        self.currencyName = currencyName
        self.country = country
        self.code = code
        self.symbol = symbol
    }
}