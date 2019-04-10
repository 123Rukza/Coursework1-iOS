//
//  UnitConverter.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/10/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Class for all unit conversions
class UnitConversions: NSObject {
    
    // MARK: - WEIGHT CONVERSIONS
    
    // Standardize all weights to kilograms for easy conversions
    static func toKilogram(unit:String, value:Double) -> Double {
        if (unit == "kg") {
            return Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.kilograms).value
        } else if (unit == "g") {
            return Measurement(value: Double(value), unit: UnitMass.grams).converted(to: UnitMass.kilograms).value
        } else if (unit == "o") {
            return Measurement(value: Double(value), unit: UnitMass.ounces).converted(to: UnitMass.kilograms).value
        } else if (unit == "p") {
            return Measurement(value: Double(value), unit: UnitMass.pounds).converted(to: UnitMass.kilograms).value
        } else {
            return Measurement(value: Double(value), unit: UnitMass.stones).converted(to: UnitMass.kilograms).value
        }
    }
    
    // Kilograms to grams
    static func toGram(value:Double) -> Double {
        return Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.grams).value
    }
    
    // Kilograms to ounce
    static func toOunce(value:Double) -> Double {
        return Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.ounces).value
    }
    
    // Kilogram to pound
    static func toPound(value:Double) -> Double {
        return Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.pounds).value
    }
    
    // Kilogram to stone
    static func toStone(value:Double) -> Double{
        return Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.stones).value
    }
}
