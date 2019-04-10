//
//  TemperatureViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class TemperatureViewController: ParentUIViewController {
    
    @IBOutlet weak var txtCelcius: UITextField!
    @IBOutlet weak var txtFarenheit: UITextField!
    @IBOutlet weak var txtKelvin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func keyboardKeyPressed(value: String) {
        
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        if(txtCelcius.isFirstResponder) {
            selectedText = txtCelcius
            unit = "c"
        } else if (txtKelvin.isFirstResponder) {
            selectedText = txtKelvin
            unit = "k"
        } else {
            selectedText = txtFarenheit
            unit = "f"
        }
        
        if (value != "DEL") {
            if(unit != "none"){
                selectedText?.text = ((selectedText?.text!)!) + value
                updateUI(selectedText: selectedText!, unit: unit, value: value)
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
        let unitKG = UnitConversions.standardizeToCelcius(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    func setValuesToUI(unit: String, kgValue: Double) {
        if (unit == "c") {
            txtFarenheit.text = String(format:"%.2f",UnitConversions.toFarenheit(value: kgValue))
            txtKelvin.text = String(format:"%.2f",UnitConversions.toKelvin(value: kgValue))
        } else if (unit == "k") {
            txtCelcius.text = String(format:"%.2f", kgValue)
            txtFarenheit.text = String(format:"%.2f",UnitConversions.toFarenheit(value: kgValue))
        } else {
            txtCelcius.text = String(format:"%.2f", kgValue)
            txtKelvin.text = String(format:"%.2f",UnitConversions.toKelvin(value: kgValue))
        }
    }
    
    func clearUI() {
        txtFarenheit.text = ""
        txtKelvin.text = ""
        txtCelcius.text = ""
    }
}
