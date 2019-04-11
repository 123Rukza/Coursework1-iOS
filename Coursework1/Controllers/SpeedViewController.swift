//
//  SpeedViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class SpeedViewController: ParentUIViewController {

    @IBOutlet weak var txtMs: UITextField!
    @IBOutlet weak var txtKMPH: UITextField!
    @IBOutlet weak var txtMPH: UITextField!
    @IBOutlet weak var txtNMPH: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
    }
    
    override func keyboardKeyPressed(value: String) {
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        if(txtMs.isFirstResponder) {
            selectedText = txtMs
            unit = "ms"
        } else if (txtKMPH.isFirstResponder) {
            selectedText = txtKMPH
            unit = "kmph"
        } else if (txtMPH.isFirstResponder) {
            selectedText = txtMPH
            unit = "mph"
        } else if (txtNMPH.isFirstResponder) {
            selectedText = txtNMPH
            unit = "nmph"
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
        let unitKG = UnitConversions.standardizeToMs(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "ms") {
            txtKMPH.text = String(format:"%.2f", UnitConversions.toKMPH(value: kgValue))
            txtMPH.text = String(format:"%.2f", UnitConversions.toMPH(value: kgValue))
            txtNMPH.text = String(format:"%.2f", UnitConversions.toNMPH(value: kgValue))
        } else if (unit == "kmph") {
            txtMs.text = String(format:"%.2f", kgValue)
            txtMPH.text = String(format:"%.2f", UnitConversions.toMPH(value: kgValue))
            txtNMPH.text = String(format:"%.2f", UnitConversions.toNMPH(value: kgValue))
        } else if (unit == "mph") {
            txtKMPH.text = String(format:"%.2f", UnitConversions.toKMPH(value: kgValue))
            txtMs.text = String(format:"%.2f", kgValue)
            txtNMPH.text = String(format:"%.2f", UnitConversions.toNMPH(value: kgValue))
        } else {
            txtKMPH.text = String(format:"%.2f", UnitConversions.toKMPH(value: kgValue))
            txtMPH.text = String(format:"%.2f", UnitConversions.toMPH(value: kgValue))
            txtMs.text = String(format:"%.2f", kgValue)
        }
    }
    
    func clearUI() {
        txtMs.text = "0"
        txtKMPH.text = "0"
        txtMPH.text = "0"
        txtNMPH.text = "0"
    }

}
