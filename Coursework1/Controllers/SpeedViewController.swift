//
//  SpeedViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Speed view controller
class SpeedViewController: ParentUIViewController {

    // Text field outlets
    @IBOutlet weak var txtMs: UITextField!
    @IBOutlet weak var txtKMPH: UITextField!
    @IBOutlet weak var txtMPH: UITextField!
    @IBOutlet weak var txtNMPH: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearUI()
        disableSoftkeyboard()
    }
    
    // Override parent key pressed event
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
        
        // Press if delete key is pressed
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
    
    // Generalised UI update method
    func updateUI(selectedText: UITextField, unit:String, value: String) {
        let unitKG = UnitConversions.standardizeToMs(unit: unit, value: Double(selectedText.text!)!)
        setValuesToUI(unit: unit, kgValue: unitKG)
    }
    
    // Update UI text field values
    func setValuesToUI(unit: String, kgValue: Double) {
        
        if (unit == "ms") {
            txtKMPH.text = String(format:"%.4f", UnitConversions.toKMPH(value: kgValue))
            txtMPH.text = String(format:"%.4f", UnitConversions.toMPH(value: kgValue))
            txtNMPH.text = String(format:"%.4f", UnitConversions.toNMPH(value: kgValue))
        } else if (unit == "kmph") {
            txtMs.text = String(format:"%.4f", kgValue)
            txtMPH.text = String(format:"%.4f", UnitConversions.toMPH(value: kgValue))
            txtNMPH.text = String(format:"%.4f", UnitConversions.toNMPH(value: kgValue))
        } else if (unit == "mph") {
            txtKMPH.text = String(format:"%.4f", UnitConversions.toKMPH(value: kgValue))
            txtMs.text = String(format:"%.4f", kgValue)
            txtNMPH.text = String(format:"%.4f", UnitConversions.toNMPH(value: kgValue))
        } else {
            txtKMPH.text = String(format:"%.4f", UnitConversions.toKMPH(value: kgValue))
            txtMPH.text = String(format:"%.4f", UnitConversions.toMPH(value: kgValue))
            txtMs.text = String(format:"%.4f", kgValue)
        }
    }
    
    // Clean UI
    func clearUI() {
        txtMs.text = "0"
        txtKMPH.text = "0"
        txtMPH.text = "0"
        txtNMPH.text = "0"
    }

    // Disable soft keyboard
    func disableSoftkeyboard() {
        txtMs.inputView = UIView()
        txtKMPH.inputView = UIView()
        txtMPH.inputView = UIView()
        txtNMPH.inputView = UIView()
    }
    
    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        var message = "Saving failed! Please enter values first"
        
        if (txtMs.text! != "0" && txtMs.text! != "") {
            UnitConversionStorage.store(key: "speed", value: txtMs.text!)
            message = "Successfully saved"
        }
        
        let alert = UIAlertController(title: "Storage Status", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnHistoryPressed(_ sender: UIBarButtonItem) {
        let storage = UnitConversionStorage.load(key: "speed")
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
