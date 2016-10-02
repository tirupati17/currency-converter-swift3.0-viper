//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class CurrencyListLocalDataManager: CurrencyListLocalDataManagerInputProtocol
{
    init() {}
    
    func loadCurrencyListArrayFromBundle() -> NSArray {
        let mainBundle = NSBundle.mainBundle()
        let path = mainBundle.pathForResource("CountryData", ofType: "plist")
        return NSArray(contentsOfFile: path!) as NSArray!
    }
}