//
//  TemperatureViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class TemperatureViewController: ParentUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func updateUIFromKeyboard(content: String) {
        txtKelvin.text = content
        txtCelcius.text = content
        txtFarenheit.text = content
    }

    @IBOutlet weak var txtCelcius: UITextField!
    @IBOutlet weak var txtFarenheit: UITextField!
    @IBOutlet weak var txtKelvin: UITextField!
}
