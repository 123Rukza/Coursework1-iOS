//
//  UnitConversionStorage.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/11/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Class to manage data storage and retrieval for history
class UnitConversionStorage: NSObject {
    
    // Saving data
    static func store (key:String, value: String) {
        var storage:[String] = []
        
        if (UserDefaults.standard.object(forKey: key) != nil) {
            if (storage.count == 5) {
                storage = Array(storage.dropLast())
            }
            storage = [value] + (UserDefaults.standard.object(forKey: key) as! [String])
        } else {
            storage.append(value)
        }
        
        UserDefaults.standard.set(storage, forKey: key)
    }
    
    // Retrieving data
    static func load(key:String)-> [String] {
        if (UserDefaults.standard.object(forKey: key) != nil) {
            return UserDefaults.standard.object(forKey: key) as! [String]
        } else {
            return []
        }
    }
}
