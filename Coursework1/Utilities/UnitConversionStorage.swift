//
//  UnitConversionStorage.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/11/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class UnitConversionStorage: NSObject {
    static func store (key:String, object:AnyObject) {
        UserDefaults.standard.set(object, forKey: key)
    }
    
    static func load(key:String)-> AnyObject {
        return UserDefaults.standard.object(forKey: key) as AnyObject
    }
}
