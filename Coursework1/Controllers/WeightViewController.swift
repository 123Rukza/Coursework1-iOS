//
//  WeightViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// View controller for Weight view
class WeightViewController: ParentUIViewController {
    
    // Text field outlets
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
    
    // Override parent method to get text input from keyboard
    override func keyboardKeyPressed(value: String) {
        var selectedText: UITextField? = nil
        var unit: String = "none"
        
        // Get selected text field
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
        
        // If delete key is pressed
        if (value != "DEL") {
            if(!(value == "." && (selectedText?.text?.contains("."))!)) // Check if decimal place is already there
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
    
    // Method to generalize UI update
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToKilogram(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    // Update text fields in the UI
    func setValuesToUI(unit: String, kgValue: Double) {
        
        // Update all text fields except for the currently selected
        if (unit == "kg") {
            txtGrams.text = String(format:"%.4f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.4f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.4f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.4f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "g") {
            txtKilograms.text = String(format:"%.4f", kgValue)
            txtOunces.text = String(format:"%.4f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.4f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.4f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "o") {
            txtGrams.text = String(format:"%.4f", UnitConversions.toGram(value: kgValue))
            txtKilograms.text = String(format:"%.4f", kgValue)
            txtPounds.text = String(format:"%.4f", UnitConversions.toPound(value: kgValue))
            txtStone.text = String(format:"%.4f", UnitConversions.toStone(value: kgValue))
        } else if (unit == "p") {
            txtGrams.text = String(format:"%.4f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.4f", UnitConversions.toOunce(value: kgValue))
            txtKilograms.text = String(format:"%.4f", kgValue)
            txtStone.text = String(format:"%.4f", UnitConversions.toStone(value: kgValue))
        } else {
            txtGrams.text = String(format:"%.4f", UnitConversions.toGram(value: kgValue))
            txtOunces.text = String(format:"%.4f", UnitConversions.toOunce(value: kgValue))
            txtPounds.text = String(format:"%.4f", UnitConversions.toPound(value: kgValue))
            txtKilograms.text = String(format:"%.4f", kgValue)
        }
    }
    
    // Set text field values to zero
    func clearUI() {
        txtKilograms.text = "0"
        txtGrams.text = "0"
        txtOunces.text = "0"
        txtPounds.text = "0"
        txtStone.text = "0"
    }
    
    // Disable software keyboard
    func disableSoftKeyboard() {
        txtKilograms.inputView = UIView()
        txtGrams.inputView = UIView()
        txtOunces.inputView = UIView()
        txtPounds.inputView = UIView()
        txtStone.inputView = UIView()
    }
    
    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        var message = "Saving failed! Please enter values first"
        
        if (txtKilograms.text! != "0" && txtKilograms.text! != "") {
            UnitConversionStorage.store(key: "weight", value: txtKilograms.text!)
            message = "Successfully saved"
        }
        
        let alert = UIAlertController(title: "Storage Status", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnHistoryPressed(_ sender: UIBarButtonItem) {
        let storage = UnitConversionStorage.load(key: "weight")
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
}
