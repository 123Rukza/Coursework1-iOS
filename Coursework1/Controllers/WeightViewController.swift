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
        clearUI()
        disableSoftKeyboard()
    }
    
    override func keyboardKeyPressed(value: String) {
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
        
        if (value != "DEL") {
            if(unit != "none"){
                if(!(value == "." && (selectedText?.text?.contains("."))!))
                {
                    selectedText?.text = ((selectedText?.text!)!) + value
                    
                    if(selectedText?.text?.first == "0") {
                        selectedText?.text = String((selectedText?.text?.dropFirst())!)
                    }
                    
                    updateUI(selectedText: selectedText!, unit: unit, value: value)
                }
            }
        } else {
            selectedText?.text = String((selectedText?.text?.dropLast())!)
            
            if((selectedText?.text?.count)! > 0) {
                updateUI(selectedText: selectedText!, unit: unit, value: value)
            } else {
                clearUI()
            }
        }
    }
    
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToKilogram(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "kg") {
            txtGrams.text = String(format:"%.2f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.2f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.2f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.2f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "g") {
            txtKilograms.text = String(format:"%.2f", kgValue)
            txtOunces.text = String(format:"%.2f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.2f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.2f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "o") {
            txtGrams.text = String(format:"%.2f", UnitConversions.toGram(value: kgValue))
            txtKilograms.text = String(format:"%.2f", kgValue)
            txtPounds.text = String(format:"%.2f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.2f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "p") {
            txtGrams.text = String(format:"%.2f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.2f", UnitConversions.toOunce(value: kgValue))
            txtKilograms.text = String(format:"%.2f", kgValue)
            txtStone.text = String(format:"%.2f", UnitConversions.toStone(value: kgValue))
        } else {
            txtGrams.text = String(format:"%.2f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.2f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.2f", UnitConversions.toPound(value: kgValue))
            txtKilograms.text = String(format:"%.2f", kgValue)
        }
    }
    
    func clearUI() {
        txtKilograms.text = "0"
        txtGrams.text = "0"
        txtOunces.text = "0"
        txtPounds.text = "0"
        txtStone.text = "0"
    }
    
    func disableSoftKeyboard() {
        txtKilograms.inputView = UIView()
        txtGrams.inputView = UIView()
        txtOunces.inputView = UIView()
        txtPounds.inputView = UIView()
        txtStone.inputView = UIView()
    }
}
