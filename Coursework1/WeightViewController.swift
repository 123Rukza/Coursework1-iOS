//
//  WeightViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UpdateSubViewDelegate {
    
    @IBOutlet weak var kilograms: UITextField!
    @IBOutlet weak var grams: UITextField!
    @IBOutlet weak var ounces: UITextField!
    @IBOutlet weak var pounds: UITextField!
    @IBOutlet weak var stonePounds: UITextField!
    
    func keyPressed(btn: UIButton) {
        var current = kilograms.text
        kilograms.text = current! + (btn.titleLabel?.text!)!
        
        current = grams.text
        grams.text = current! + (btn.titleLabel?.text!)!
        
        current = ounces.text
        ounces.text = current! + (btn.titleLabel?.text!)!
        
        current = pounds.text
        pounds.text = current! + (btn.titleLabel?.text!)!
        
        current = stonePounds.text
        stonePounds.text = current! + (btn.titleLabel?.text!)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
}
