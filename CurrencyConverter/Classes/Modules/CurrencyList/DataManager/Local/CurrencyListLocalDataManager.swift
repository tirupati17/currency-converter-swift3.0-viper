//
// Created by Tirupati Balan
// Copyright (c) 2019 Celerstudio. All rights reserved.
//

import Foundation

class CurrencyListLocalDataManager: CurrencyListLocalDataManagerInputProtocol
{
    init() {}
    
    func loadCurrencyListArrayFromBundle() -> NSArray {
        let mainBundle = Bundle.main
        let path = mainBundle.path(forResource: "CountryData", ofType: "plist")
        return NSArray(contentsOfFile: path!) as NSArray!
    }
}
