//
//  KeyboardViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/10/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let parent = self.parent?.view
    }
    
    @IBOutlet weak var btnNegate: UIButton!
    
    @IBAction func keyboardButtonPressed(_ sender: UIButton) {
        let vc = self.parent as! ParentUIViewController
        vc.updateUIFromKeyboard(content: (sender.titleLabel?.text!)!)
    }

    
}
