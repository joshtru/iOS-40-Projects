//
//  ViewController.swift
//  RearrangeAndDelete
//
//  Created by Joshua Okoro on 2/23/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var listTable: UITableView!
    
    var listModel = List()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - TableView
    // Returning number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Returning number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.data.count
    }
    
    // Displaying Data on Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        cell.textLabel?.text = listModel.data[indexPath.row]
        
        return cell
    }
    
    // Enable TableView Cell Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TableView Editing style
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            listModel.data.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    // Rearranging TableView
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        sender.title = "Done"
    }
    

}

