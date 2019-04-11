//
//  LengthViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class LengthViewController: ParentUIViewController {
    
    @IBOutlet weak var txtMetre: UITextField!
    @IBOutlet weak var txtMile: UITextField!
    @IBOutlet weak var txtCentimeter: UITextField!
    @IBOutlet weak var txtMillimeter: UITextField!
    @IBOutlet weak var txtYard: UITextField!
    @IBOutlet weak var txtInch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
    }
    
    override func keyboardKeyPressed(value: String) {
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        if(txtMetre.isFirstResponder) {
            selectedText = txtMetre
            unit = "me"
        } else if (txtMile.isFirstResponder) {
            selectedText = txtMile
            unit = "mi"
        } else if (txtCentimeter.isFirstResponder) {
            selectedText = txtCentimeter
            unit = "cm"
        } else if (txtMillimeter.isFirstResponder) {
            selectedText = txtMillimeter
            unit = "mm"
        } else if (txtYard.isFirstResponder) {
            selectedText = txtYard
            unit = "y"
        } else if (txtInch.isFirstResponder) {
            selectedText = txtInch
            unit = "i"
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
        let unitKG = UnitConversions.standardizeToMetre(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "me") {
            txtMile.text = String(format:"%.2f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.2f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.2f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.2f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.2f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "mi") {
            txtMetre.text = String(format:"%.2f", kgValue)
            txtCentimeter.text = String(format:"%.2f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.2f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.2f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.2f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "cm") {
            txtMile.text = String(format:"%.2f", UnitConversions.toMiles(value: kgValue))
            txtMetre.text = String(format:"%.2f", kgValue)
            txtMillimeter.text = String(format:"%.2f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.2f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.2f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "mm") {
            txtMile.text = String(format:"%.2f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.2f", UnitConversions.toCentimeters(value: kgValue))
            txtMetre.text = String(format:"%.2f", kgValue)
            txtYard.text = String(format:"%.2f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.2f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "y") {
            txtMile.text = String(format:"%.2f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.2f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.2f", UnitConversions.toMillimeters(value: kgValue))
            txtMetre.text = String(format:"%.2f", kgValue)
            txtInch.text = String(format:"%.2f", UnitConversions.toInches(value: kgValue))
        } else {
            txtMile.text = String(format:"%.2f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.2f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.2f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.2f", UnitConversions.toYards(value: kgValue))
            txtMetre.text = String(format:"%.2f", kgValue)
        }
    }
    
    func clearUI() {
        txtMetre.text = "0"
        txtMile.text = "0"
        txtCentimeter.text = "0"
        txtMillimeter.text = "0"
        txtYard.text = "0"
        txtInch.text = "0"
    }
}
