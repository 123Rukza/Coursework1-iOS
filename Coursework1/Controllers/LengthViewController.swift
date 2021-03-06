//
//  LengthViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Length view controller
class LengthViewController: ParentUIViewController {
    
    // Text field outlets
    @IBOutlet weak var txtMetre: UITextField!
    @IBOutlet weak var txtMile: UITextField!
    @IBOutlet weak var txtCentimeter: UITextField!
    @IBOutlet weak var txtMillimeter: UITextField!
    @IBOutlet weak var txtYard: UITextField!
    @IBOutlet weak var txtInch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
        disableSoftKeyboard()
    }
    
    // Override parent key pressed
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
        
        if (unit != "none"){
            // Check if delete is pressed
            if (value != "DEL") {
                if(!(value == "." && (selectedText?.text?.contains("."))!))
                {
                    selectedText?.text = ((selectedText?.text!)!) + value
                    
                    if(selectedText?.text?.first == "0") {
                        selectedText?.text = String((selectedText?.text?.dropFirst())!)
                    }
                    
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
    }
    
    // Generalised update method
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToMetre(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    // Update UI values
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "me") {
            txtMile.text = String(format:"%.4f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.4f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.4f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.4f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.4f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "mi") {
            txtMetre.text = String(format:"%.4f", kgValue)
            txtCentimeter.text = String(format:"%.4f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.4f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.4f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.4f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "cm") {
            txtMile.text = String(format:"%.4f", UnitConversions.toMiles(value: kgValue))
            txtMetre.text = String(format:"%.4f", kgValue)
            txtMillimeter.text = String(format:"%.4f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.4f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.4f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "mm") {
            txtMile.text = String(format:"%.4f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.4f", UnitConversions.toCentimeters(value: kgValue))
            txtMetre.text = String(format:"%.4f", kgValue)
            txtYard.text = String(format:"%.4f", UnitConversions.toYards(value: kgValue))
            txtInch.text = String(format:"%.4f", UnitConversions.toInches(value: kgValue))
        } else if (unit == "y") {
            txtMile.text = String(format:"%.4f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.4f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.4f", UnitConversions.toMillimeters(value: kgValue))
            txtMetre.text = String(format:"%.4f", kgValue)
            txtInch.text = String(format:"%.4f", UnitConversions.toInches(value: kgValue))
        } else {
            txtMile.text = String(format:"%.4f", UnitConversions.toMiles(value: kgValue))
            txtCentimeter.text = String(format:"%.4f", UnitConversions.toCentimeters(value: kgValue))
            txtMillimeter.text = String(format:"%.4f", UnitConversions.toMillimeters(value: kgValue))
            txtYard.text = String(format:"%.4f", UnitConversions.toYards(value: kgValue))
            txtMetre.text = String(format:"%.4f", kgValue)
        }
    }
    
    // Clean UI
    func clearUI() {
        txtMetre.text = "0"
        txtMile.text = "0"
        txtCentimeter.text = "0"
        txtMillimeter.text = "0"
        txtYard.text = "0"
        txtInch.text = "0"
    }
    
    // Disable soft keyboard
    func disableSoftKeyboard() {
        txtMetre.inputView = UIView()
        txtMile.inputView = UIView()
        txtCentimeter.inputView = UIView()
        txtMillimeter.inputView = UIView()
        txtYard.inputView = UIView()
        txtInch.inputView = UIView()
    }
    
    // Save button pressed
    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        var message = "Saving failed! Please enter values first"
        
        if (txtMetre.text! != "0" && txtMetre.text! != "") {
            UnitConversionStorage.store(key: "length", value: printString())
            message = "Successfully saved"
        }
        
        let alert = UIAlertController(title: "Storage Status", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // History button pressed
    @IBAction func btnHistoryPressed(_ sender: UIBarButtonItem) {
        let storage = UnitConversionStorage.load(key: "length")
        if (storage.count > 0) {
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            self.present(destination, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "No history found for this conversion", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Get printable string 
    func printString()->String {
        return String(format: "%.4f", Double(txtMetre.text!)!) + " metres = " + String(format: "%.4f", Double(txtMile.text!)!) + " miles = " + String(format: "%.4f", Double(txtCentimeter.text!)!) + " centimeters = " + String(format: "%.4f", Double(txtMillimeter.text!)!) + " millimeters = " + String(format: "%.4f", Double(txtYard.text!)!) + " yards = " + String(format: "%.4f", Double(txtInch.text!)!) + " inches"
    }
}
