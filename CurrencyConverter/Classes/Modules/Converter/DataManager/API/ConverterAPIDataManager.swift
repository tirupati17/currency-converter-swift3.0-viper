//
// Created by Tirupati Balan
// Copyright (c) 2019 Celerstudio. All rights reserved.
//

import Foundation

class ConverterAPIDataManager: ConverterAPIDataManagerInputProtocol
{
    init() {}
    
    func fetchCurrencyFromServerWithData(_ baseCurrencyCode: String, completion: ((AnyObject) -> Void)!, failed:((AnyObject) -> Void)!) {
        URLSession.init(configuration: .default).dataTask(with: URL.init(string: "https://frankfurter.app/latest?base=\(baseCurrencyCode)")!) { (data, response, error) in
            if error != nil {
                failed?(error as AnyObject)
            } else {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    completion?(jsonObject as AnyObject)
                } catch let myJSONError {
                    failed?(myJSONError as AnyObject)
                }
            }
        }.resume()
    }
}
