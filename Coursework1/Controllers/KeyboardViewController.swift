//
//  KeyboardViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/10/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// View controller for the keyboard container
class KeyboardViewController: UIViewController {
    
    // Negate button outlet
    @IBOutlet weak var btnNegate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNegate.isHidden = true
    }
    
    // Action called when any button on the keyboard is pressed
    @IBAction func keyboardButtonPressed(_ sender: UIButton) {
        let vc = self.parent as! ParentUIViewController
        vc.keyboardKeyPressed(value: (sender.titleLabel?.text!)!)
    }
    
}
