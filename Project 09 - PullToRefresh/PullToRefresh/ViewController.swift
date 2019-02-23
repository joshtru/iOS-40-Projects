//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Joshua Okoro on 2/23/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var groceriesTable: UITableView!
    
    let pullRequest = UIRefreshControl()
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        groceriesTable.addSubview(pullRequest)
        pullRequest.backgroundColor = UIColor.gray
        pullRequest.attributedTitle = NSAttributedString(string: "Refreshing")
        pullRequest.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        
    }
    
    
    // MARK: - Data
    var list = ["Mango", "Banana", "Egg", "Fish", "Meat"]
    
    let cloudData = ["Milk", "Strawberry", "Plantain", "Peach"]
    
    // MARK: - Functions
    @objc func refreshTable() {
        let listSet = Set(list)
        let cloudDataSet = Set(cloudData)
        
        if cloudDataSet.isSubset(of: listSet) {
            pullRequest.endRefreshing()
        } else {
            list += cloudData
            groceriesTable.reloadData()
            pullRequest.endRefreshing()
        }
    }
    
    // MARK: - TableView
    
    //Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // Display Data to TableView Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceriesCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    


}

