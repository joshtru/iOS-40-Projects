//
//  ItemsTableViewController.swift
//  AddingItems
//
//  Created by Joshua Okoro on 2/24/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController, AddItem {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Data
    var items = ItemModel()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        cell.textLabel?.text = items.data[indexPath.row]

        return cell
    }
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    @IBAction func EditButtonPressed(_ sender: UIBarButtonItem) {
        editButton.title = editButton.title == "Edit" ? "Done" : "Edit"
        tableView.isEditing = !tableView.isEditing
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.data.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = items.data[sourceIndexPath.row]
        items.data.remove(at: sourceIndexPath.row)
        items.data.insert(item, at: destinationIndexPath.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ToSecondView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondView" {
            let destinationVC = segue.destination as! AddItemViewController
            destinationVC.delegate = self
        }
    }
    
    func newItem(data: String) {
        items.data.append(data)
    }
    
    // MARK: - Reload TableView after Adding Item
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
