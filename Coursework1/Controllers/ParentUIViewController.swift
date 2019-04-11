//
//  ParentUIViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/10/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

// Parent class for UI's. Created to have easy access from keyboard to main view
class ParentUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Abstract method to be updated when keys are pressed
    func keyboardKeyPressed(value: String) {
        // abstract
    }

}
