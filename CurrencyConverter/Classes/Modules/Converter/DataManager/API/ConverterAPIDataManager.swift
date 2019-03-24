//
// Created by Tirupati Balan
// Copyright (c) 2019 Celerstudio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ConverterAPIDataManager: ConverterAPIDataManagerInputProtocol
{
    init() {}
    
    func fetchCurrencyFromServerWithData(_ baseCurrencyCode: String, completion: ((AnyObject) -> Void)!, failed:((AnyObject) -> Void)!) {
        Alamofire.request("https://frankfurter.app/latest?base=\(baseCurrencyCode)").responseJSON { response in
            print(String(describing: response.request?.description))
            if response.result.isSuccess {
                do {
                    let jsonObject = try JSON(data: response.data!)
                    completion?(jsonObject as AnyObject)
                } catch {
                    failed?(response.result.error as AnyObject)
                }
            } else {
                failed?(response.result.error as AnyObject)
            }
        }
    }
}
