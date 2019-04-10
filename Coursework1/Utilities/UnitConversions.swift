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
    static func standardizeToKilogram(unit:String, value:Double) -> Double {
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
    
    
    // MARK: - TEMPERATURE CONVERSIONS
    
    // Standardize all temperatures to celcius
    static func standardizeToCelcius(unit:String, value:Double)->Double {
        if (unit == "c") {
            return Measurement(value: Double(value), unit: UnitTemperature.celsius).converted(to: UnitTemperature.celsius).value
        } else if (unit == "k") {
            return Measurement(value: Double(value), unit: UnitTemperature.kelvin).converted(to: UnitTemperature.celsius).value
        } else {
            return Measurement(value: Double(value), unit: UnitTemperature.fahrenheit).converted(to: UnitTemperature.celsius).value
        }
    }
    
    // Celcius to farenheit
    static func toFarenheit(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitTemperature.celsius).converted(to: UnitTemperature.fahrenheit).value
    }
    
    // Celcius to kelvin
    static func toKelvin(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitTemperature.celsius).converted(to: UnitTemperature.kelvin).value
    }
    
    // MARK: - LENGTH CONVERSIONS
    // Standardize all lengths to metres
    static func standardizeToMetre(unit:String, value:Double)->Double {
        if (unit == "me") {
            return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.meters).value
        } else if (unit == "mi") {
            return Measurement(value: Double(value), unit: UnitLength.miles).converted(to: UnitLength.meters).value
        } else if (unit == "cm") {
            return Measurement(value: Double(value), unit: UnitLength.centimeters).converted(to: UnitLength.meters).value
        } else if (unit == "mm") {
            return Measurement(value: Double(value), unit: UnitLength.millimeters).converted(to: UnitLength.meters).value
        } else if (unit == "y") {
            return Measurement(value: Double(value), unit: UnitLength.yards).converted(to: UnitLength.meters).value
        } else {
            return Measurement(value: Double(value), unit: UnitLength.inches).converted(to: UnitLength.meters).value
        }
    }
    
    // Metres to miles
    static func toMiles(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.miles).value
    }
    
    // Metres to centimeters
    static func toCentimeters(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.centimeters).value
    }
    
    // Metres to millimeters
    static func toMillimeters(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.millimeters).value
    }
    
    // Metres to yards
    static func toYards(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.yards).value
    }
    
    // Metres to inches
    static func toInches(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitLength.meters).converted(to: UnitLength.inches).value
    }
    
    
    // MARK: - SPEED CONVERSIONS
    // Standardize all standardize all speeds to metres per second
    static func standardizeToMs(unit:String, value:Double)->Double{
        if (unit == "ms") {
            return Measurement(value: Double(value), unit: UnitSpeed.metersPerSecond).converted(to: UnitSpeed.metersPerSecond).value
        } else if (unit == "ks") {
            return Measurement(value: Double(value), unit: UnitSpeed.kilometersPerHour).converted(to: UnitSpeed.metersPerSecond).value
        } else if (unit == "mis") {
            return Measurement(value: Double(value), unit: UnitSpeed.milesPerHour).converted(to: UnitSpeed.metersPerSecond).value
        } else {
            return Measurement(value: Double(value), unit: UnitSpeed.knots).converted(to: UnitSpeed.metersPerSecond).value
        }
    }
    
    // Metres per second to kilometers per second
    static func toKMPH(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitSpeed.metersPerSecond).converted(to: UnitSpeed.kilometersPerHour).value
    }
    
    // Metres per second to miles per hour
    static func toMPH(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitSpeed.metersPerSecond).converted(to: UnitSpeed.metersPerSecond).value
    }
    
    // Metres per second to nautical miles per hour
    static func toNMPH(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitSpeed.metersPerSecond).converted(to: UnitSpeed.knots).value
    }
    
    
    // MARK: - VOLUME CONVERSIONS
    // Standardize all volumes to gallons
    static func standardizeToLitre(unit:String, value:Double)->Double {
        if (unit == "g") {
            return Measurement(value: Double(value), unit: UnitVolume.gallons).converted(to: UnitVolume.gallons).value
        } else if (unit == "l") {
            return Measurement(value: Double(value), unit: UnitVolume.liters).converted(to: UnitVolume.gallons).value
        } else if (unit == "p") {
            return Measurement(value: Double(value), unit: UnitVolume.pints).converted(to: UnitVolume.gallons).value
        } else if (unit == "f") {
            return Measurement(value: Double(value), unit: UnitVolume.fluidOunces).converted(to: UnitVolume.gallons).value
        } else {
            return Measurement(value: Double(value), unit: UnitVolume.milliliters).converted(to: UnitVolume.gallons).value
        }
    }
    
    // Gallons to litres
    static func toLitre(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitVolume.milliliters).converted(to: UnitVolume.liters).value
    }
    
    // Gallons to pints
    static func toPint(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitVolume.milliliters).converted(to: UnitVolume.pints).value
    }
    
    // Gallons to fluid ounce
    static func toFluidOunce(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitVolume.milliliters).converted(to: UnitVolume.fluidOunces).value
    }
    
    // Gallons to milliletre
    static func toMilliliter(value:Double)->Double {
        return Measurement(value: Double(value), unit: UnitVolume.milliliters).converted(to: UnitVolume.milliliters).value
    }
}
