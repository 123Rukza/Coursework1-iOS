//
//  WeightViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class WeightViewController: ParentUIViewController {
    
    @IBOutlet weak var txtKilograms: UITextField!
    @IBOutlet weak var txtGrams: UITextField!
    @IBOutlet weak var txtOunces: UITextField!
    @IBOutlet weak var txtPounds: UITextField!
    @IBOutlet weak var txtStone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func updateUIFromKeyboard(content: String) {
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        if(txtKilograms.isFirstResponder) {
            selectedText = txtKilograms
            unit = "kg"
        } else if (txtGrams.isFirstResponder) {
            selectedText = txtGrams
            unit = "g"
        } else if (txtOunces.isFirstResponder) {
            selectedText = txtOunces
            unit = "o"
        } else if (txtPounds.isFirstResponder) {
            selectedText = txtPounds
            unit = "p"
        } else if (txtStone.isFirstResponder) {
            selectedText = txtStone
            unit = "s"
        }
        
        if(unit != "none"){
            selectedText?.text = (selectedText?.text!)! + content
            let unitKG = convertToKilograms(unit: unit, value: Double(selectedText!.text!)!)
            
            print(unitKG)
        }
    }
    
    func convertToKilograms(unit: String, value: Double)-> Double {
        print(unit, value)
        
        var unitKG: Double = 0.0
        
        if (unit == "kg") {
            unitKG = Measurement(value: Double(value), unit: UnitMass.kilograms).converted(to: UnitMass.kilograms).value
        } else if (unit == "g") {
            unitKG = Measurement(value: Double(value), unit: UnitMass.grams).converted(to: UnitMass.kilograms).value
        } else if (unit == "o") {
            unitKG = Measurement(value: Double(value), unit: UnitMass.ounces).converted(to: UnitMass.kilograms).value
        } else if (unit == "p") {
            unitKG = Measurement(value: Double(value), unit: UnitMass.pounds).converted(to: UnitMass.kilograms).value
        } else {
            unitKG = Measurement(value: Double(value), unit: UnitMass.stones).converted(to: UnitMass.kilograms).value
        }
        
        return unitKG
    }
    
    func setValuesToUI(unit: String, value: Double) {
        
    }

}
