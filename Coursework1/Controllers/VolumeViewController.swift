//
//  VolumeViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Volume view controller
class VolumeViewController: ParentUIViewController {
    
    // Text field outlets
    @IBOutlet weak var txtGallon: UITextField!
    @IBOutlet weak var txtLitre: UITextField!
    @IBOutlet weak var txtPint: UITextField!
    @IBOutlet weak var txtFluidOunce: UITextField!
    @IBOutlet weak var txtMillilitre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableSoftKeyboard()
        clearUI()
    }
    
    // Override parent method to get keyboard input
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
        
        if(unit != "none"){
            // Check if delete key is pressed
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
    
    // generalised UI update method
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToGallon(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    // Update the UI
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "g") {
            txtLitre.text = String(format:"%.4f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.4f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.4f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.4f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "l") {
            txtGallon.text = String(format:"%.4f", kgValue)
            txtPint.text = String(format:"%.4f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.4f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.4f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "p") {
            txtLitre.text = String(format:"%.4f", UnitConversions.toLitre(value: kgValue))
            txtGallon.text = String(format:"%.4f", kgValue)
            txtFluidOunce.text = String(format:"%.4f", UnitConversions.toFluidOunce(value: kgValue))
            txtMillilitre.text = String(format:"%.4f", UnitConversions.toMilliliter(value: kgValue))
        } else if (unit == "f") {
            txtLitre.text = String(format:"%.4f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.4f", UnitConversions.toPint(value: kgValue))
            txtGallon.text = String(format:"%.4f", kgValue)
            txtMillilitre.text = String(format:"%.4f", UnitConversions.toMilliliter(value: kgValue))
        } else {
            txtLitre.text = String(format:"%.4f", UnitConversions.toLitre(value: kgValue))
            txtPint.text = String(format:"%.4f", UnitConversions.toPint(value: kgValue))
            txtFluidOunce.text = String(format:"%.4f", UnitConversions.toFluidOunce(value: kgValue))
            txtGallon.text = String(format:"%.4f", kgValue)
        }
    }
    
    // Clean UI with zeroes
    func clearUI() {
        txtGallon.text = "0"
        txtLitre.text = "0"
        txtPint.text = "0"
        txtFluidOunce.text = "0"
        txtMillilitre.text = "0"
    }
    
    // Disable software keyboard
    func disableSoftKeyboard() {
        txtGallon.inputView = UIView()
        txtLitre.inputView = UIView()
        txtPint.inputView = UIView()
        txtFluidOunce.inputView = UIView()
        txtMillilitre.inputView = UIView()
    }
    
    // Save button pressed
    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        var message = "Saving failed! Please enter values first"
        
        if (txtGallon.text! != "0" && txtGallon.text! != "") {
            UnitConversionStorage.store(key: "volume", value: printString())
            message = "Successfully saved"
        }
        
        let alert = UIAlertController(title: "Storage Status", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // View history button pressed
    @IBAction func btnHistoryPressed(_ sender: UIBarButtonItem) {
        let storage = UnitConversionStorage.load(key: "volume")
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
    
    // function to get printable values of all fields
    func printString()->String {
        return String(format: "%.4f", Double(txtGallon.text!)!) + " gallons = " + String(format: "%.4f", Double(txtLitre.text!)!) + " litres = " + String(format: "%.4f", Double(txtPint.text!)!) + " UK pints = " + String(format: "%.4f", Double(txtFluidOunce.text!)!) + " fluid ounces = " + String(format: "%.4f", Double(txtMillilitre.text!)!) + " millilitres"
    }
    
}
