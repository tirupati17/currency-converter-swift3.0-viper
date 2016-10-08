//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ConverterAPIDataManager: ConverterAPIDataManagerInputProtocol
{
    init() {}
    
    func fetchCurrencyFromServerWithData(_ baseCurrencyCode: String, completion: ((AnyObject) -> Void)!, failed:((AnyObject) -> Void)!) {
        Alamofire.request("http://api.fixer.io/latest?base=\(baseCurrencyCode)").responseJSON { response in
            print(response.request?.description)
            if response.result.isSuccess {
                let jsonObject = JSON(data: response.data!)
                completion?(jsonObject as AnyObject)
            } else {
                failed?(response.result.error as AnyObject)
            }
        }
    }
}
