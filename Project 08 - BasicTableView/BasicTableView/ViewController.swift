//
//  ViewController.swift
//  BasicTableView
//
//  Created by Joshua Okoro on 2/23/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Data
    let list = ["Milk", "Egg", "Tea", "Bread"]
    
    
    // MARK: - TableView
    
    // TableView Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // TableView Return Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceriesCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }


}

