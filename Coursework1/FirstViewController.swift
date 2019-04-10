//
//  FirstViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 3/29/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

protocol UpdateSubViewDelegate {
    func keyPressed(btn: UIButton)
}

class FirstViewController: UIViewController {
    
    var delegate: UpdateSubViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_weight_embed" {
            let containerVC = segue.destination  as!   WeightViewController
//            self.delegate = containerVC
        }
    }
    
    @IBAction func click_CalculatorButton(_ sender: UIButton) {
        delegate?.keyPressed(btn: sender)
        print(sender.titleLabel?.text!)
    }
}

