//
//  VolumeViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class VolumeViewController: ParentUIViewController {
    
    @IBOutlet weak var txtGallon: UITextField!
    @IBOutlet weak var txtLitre: UITextField!
    @IBOutlet weak var txtPint: UITextField!
    @IBOutlet weak var txtFluidOunce: UITextField!
    @IBOutlet weak var txtMillilitre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
    }
    
    override func keyboardKeyPressed(value: String) {
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        if(txtGallon.isFirstResponder) {
            selectedText = txtGallon
            unit = "g"
        } else if (txtLitre.isFirstResponder) {
            selectedText = txtLitre
            unit = "l"
        } else if (txtPint.isFirstResponder) {
            selectedText = txtPint
            unit = "p"
        } else if (txtFluidOunce.isFirstResponder) {
            selectedText = txtFluidOunce
            unit = "f"
        } else {
            selectedText = txtMillilitre
            unit = "m"
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
        let unitKG = UnitConversions.standardizeToGallon(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "g") {
            txtLitre.text = String(format:"%.2f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.2f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.2f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.2f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "l") {
            txtGallon.text = String(format:"%.2f", kgValue)
            txtPint.text = String(format:"%.2f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.2f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.2f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "p") {
            txtLitre.text = String(format:"%.2f", UnitConversions.toLitre(value: kgValue))
            txtGallon.text = String(format:"%.2f", kgValue)
            txtFluidOunce.text = String(format:"%.2f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.2f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "f") {
            txtLitre.text = String(format:"%.2f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.2f", UnitConversions.toPint(value: kgValue))
            txtGallon.text = String(format:"%.2f", kgValue)
            txtMillilitre.text = String(format:"%.2f", UnitConversions.toMilliliter(value: kgValue))
        } else {
            txtLitre.text = String(format:"%.2f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.2f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.2f", UnitConversions.toFluidOunce(value: kgValue))
            txtGallon.text = String(format:"%.2f", kgValue)
        }
    }
    
    func clearUI() {
        txtGallon.text = "0"
        txtLitre.text = "0"
        txtPint.text = "0"
        txtFluidOunce.text = "0"
        txtMillilitre.text = "0"
    }
    
}
