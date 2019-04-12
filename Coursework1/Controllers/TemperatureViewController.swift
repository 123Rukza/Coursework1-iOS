//
//  TemperatureViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Temperature view controller
class TemperatureViewController: ParentUIViewController {
    
    // Text field outlets
    @IBOutlet weak var txtCelcius: UITextField!
    @IBOutlet weak var txtFarenheit: UITextField!
    @IBOutlet weak var txtKelvin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
        disableSoftKeyboard()
        
        // enable negation key for temperature
        let keyboard = self.children.first as? KeyboardViewController
        keyboard?.btnNegate.isHidden = false
    }
    
    // Override key pressed from keyboard
    override func keyboardKeyPressed(value: String) {
        
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        // Get selected text field
        if(txtCelcius.isFirstResponder) {
            selectedText = txtCelcius
            unit = "c"
        } else if (txtFarenheit.isFirstResponder) {
            selectedText = txtFarenheit
            unit = "f"
        } else if (txtKelvin.isFirstResponder){
            selectedText = txtKelvin
            unit = "k"
        }
        
        if (unit != "none") {
            // Checking for both delete and negation
            if (value != "DEL" && value != "+/-") {
                if(!(value == "." && (selectedText?.text?.contains("."))!))
                {
                    selectedText?.text = ((selectedText?.text!)!) + value
                    
                    if(selectedText?.text?.first == "0") {
                        selectedText?.text = String((selectedText?.text?.dropFirst())!)
                    }
                    
                    updateUI(selectedText: selectedText!, unit: unit, value: value)
                }
                // Don't apply negation if amount of characters is = 0
            } else if (value == "+/-" && (selectedText?.text?.count)! > 0) {
                if ((selectedText?.text?.contains("-"))!) {
                    selectedText?.text = String((selectedText?.text?.dropFirst())!)
                } else {
                    selectedText?.text = "-" + (selectedText?.text)!
                }
                updateUI(selectedText: selectedText!, unit: unit, value: value)
            } else if (value == "DEL"){
                selectedText?.text = String((selectedText?.text?.dropLast())!)
                
                if((selectedText?.text?.count)! > 0 && selectedText?.text! != "-") {
                    updateUI(selectedText: selectedText!, unit: unit, value: value)
                } else {
                    clearUI()
                }
            }
        }
    }
    
    // Generalised UI update function
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToCelcius(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    // Set values to the text fields
    func setValuesToUI(unit: String, kgValue: Double) {
        if (unit == "c") {
            txtFarenheit.text = String(format:"%.4f",UnitConversions.toFarenheit(value: kgValue))
            txtKelvin.text = String(format:"%.4f",UnitConversions.toKelvin(value: kgValue))
        } else if (unit == "k") {
            txtCelcius.text = String(format:"%.4f", kgValue)
            txtFarenheit.text = String(format:"%.4f",UnitConversions.toFarenheit(value: kgValue))
        } else {
            txtCelcius.text = String(format:"%.4f", kgValue)
            txtKelvin.text = String(format:"%.4f",UnitConversions.toKelvin(value: kgValue))
        }
    }
    
    // Clean UI
    func clearUI() {
        txtFarenheit.text = "0"
        txtKelvin.text = "0"
        txtCelcius.text = "0"
    }
    
    // Disable soft keyboard
    func disableSoftKeyboard() {
        txtFarenheit.inputView = UIView()
        txtKelvin.inputView = UIView()
        txtCelcius.inputView = UIView()
    }
    
    // Save button pressed
    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        var message = "Saving failed! Please enter values first"
        
        if (txtCelcius.text! != "0" && txtCelcius.text! != "") {
            UnitConversionStorage.store(key: "temperature", value: printString())
            message = "Successfully saved"
        }
        
        let alert = UIAlertController(title: "Storage Status", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // History button pressed
    @IBAction func btnHistoryPressed(_ sender: UIBarButtonItem) {
        let storage = UnitConversionStorage.load(key: "temperature")
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
        return String(format: "%.4f", Double(txtFarenheit.text!)!) + " Farenheit = " + String(format: "%.4f", Double(txtKelvin.text!)!) + " Kelvin = " + String(format: "%.4f", Double(txtCelcius.text!)!) + " Celsius"
    }
}
