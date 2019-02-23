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
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Data
    var data = ["Tea", "Bread", "Sugar", "Milk", "Cake"]
    
    
    // MARK: - TableView
    // Returning number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Returning number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Displaying Data on Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    // Enable TableView Cell Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TableView Editing style
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            data.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    
    // Rearranging TableView
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if listTable.isEditing {
            return .none
        } else {
            return .delete
        }
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        listTable.isEditing = !listTable.isEditing
       editButton.title =  editButton.title == "Reorder" ? "Done" : "Reorder"
    }
    

}

