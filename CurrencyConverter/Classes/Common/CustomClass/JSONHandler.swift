//
//  JSONHandler.swift
//  CurrencyConverter
//
//  Created by Tirupati Balan on 25/03/19.
//  Copyright © 2019 CelerStudio. All rights reserved.
//

// NOTE: Inspired by JSONHandler via Mixpanel ios analytics platform

import Foundation

class JSONHandler {
    
    typealias MPObjectToParse = Any
    
    class func encodeAPIData(_ obj: MPObjectToParse) -> String? {
        let data: Data? = serializeJSONObject(obj)
        
        guard let d = data else {
            print("couldn't serialize object")
            return nil
        }
        
        let base64Encoded = d.base64EncodedString(options: .lineLength64Characters)
        
        guard let b64 = base64Encoded
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
                print("couldn't replace characters to allowed URL character set")
                return nil
        }
        
        return b64
    }
    
    class func serializeJSONObject(_ obj: MPObjectToParse) -> Data? {
        let serializableJSONObject = makeObjectSerializable(obj)
        
        guard JSONSerialization.isValidJSONObject(serializableJSONObject) else {
            print("object isn't valid and can't be serialzed to JSON")
            return nil
        }
        var serializedObject: Data? = nil
        do {
            serializedObject = try JSONSerialization
                .data(withJSONObject: serializableJSONObject, options: [])
        } catch {
            print("exception encoding api data")
        }
        return serializedObject
    }
    
    private class func makeObjectSerializable(_ obj: MPObjectToParse) -> MPObjectToParse {
        switch obj {
        case is String, is Int, is UInt, is UInt64, is Double, is Float, is Bool:
            return obj
            
        case let obj as Array<Any>:
            return obj.map() { makeObjectSerializable($0) }
            
        case let obj as Date:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: obj)
            
        case let obj as URL:
            return obj.absoluteString
            
        default:
            print("enforcing string on object")
            return String(describing: obj)
        }
    }
    
}
