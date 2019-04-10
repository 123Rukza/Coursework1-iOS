//
//  KeyboardViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/10/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    @IBOutlet weak var btnNegate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNegate.isHidden = true
    }
    
    
    @IBAction func keyboardButtonPressed(_ sender: UIButton) {
        let vc = self.parent as! ParentUIViewController
        vc.keyboardKeyPressed(value: (sender.titleLabel?.text!)!)
    }
    
}
