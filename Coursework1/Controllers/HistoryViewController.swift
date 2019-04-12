//
//  HistoryViewController.swift
//  Coursework1
//
//  Created by Rukshan Hassim on 4/12/19.
//  Copyright © 2019 Rukshan Hassim. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // History values store
    var storage:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // overriding delegate
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.count
    }
    
    // overriding delegate
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = storage[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    // back button pressed
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
