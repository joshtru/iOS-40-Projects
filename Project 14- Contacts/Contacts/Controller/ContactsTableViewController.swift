//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Joshua Okoro on 2/26/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

let contactModel = Model()
class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Data

    // MARK: - Table view data source

    // Return Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // Return Number of Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return contactModel.recent.count
        case 1:
            return contactModel.friends.count
        default:
            return 0
        }
    }

    // Return cell with data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! PersonTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.profileImageView.image = UIImage(named: contactModel.recent[indexPath.row]["contactImage"]!)
            cell.nameLabel.text = contactModel.recent[indexPath.row]["name"]!
        case 1:
            cell.profileImageView.image = UIImage(named: contactModel.friends[indexPath.row]["contactImage"]!)
            cell.nameLabel.text = contactModel.friends[indexPath.row]["name"]!
        default:
            break
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
        
        
        switch section {
        case 0:
            cell.headerLabel.text = "RECENT"
        case 1:
            cell.headerLabel.text = "FRIENDS"
        default:
            break
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToInfoCard" {
            let destinationVC = segue.destination as! InfoCardTableViewController
            destinationVC.selectedIndexPath = tableView.indexPathForSelectedRow!
        }
    }

}
