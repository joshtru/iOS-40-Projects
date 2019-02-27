//
//  InfoCardTableViewController.swift
//  Contacts
//
//  Created by Joshua Okoro on 2/26/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class InfoCardTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    var selectedIndexPath = IndexPath()
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCardCell", for: indexPath) as! InfoCardTableViewCell

        switch selectedIndexPath.section {
        case 0:
            cell.profileImageView.image = UIImage(named: contactModel.recent[selectedIndexPath.row]["infoImage"]!)
            cell.nameLabel.text = contactModel.recent[selectedIndexPath.row]["name"]!
            cell.numberLabel.text = contactModel.recent[selectedIndexPath.row]["number"]!
            cell.emailLabel.text = contactModel.recent[selectedIndexPath.row]["email"]!
            cell.notesLabel.text = contactModel.recent[selectedIndexPath.row]["notes"]!
        case 1:
            cell.profileImageView.image = UIImage(named: contactModel.friends[selectedIndexPath.row]["infoImage"]!)
            cell.nameLabel.text = contactModel.friends[selectedIndexPath.row]["name"]!
            cell.numberLabel.text = contactModel.friends[selectedIndexPath.row]["number"]!
            cell.emailLabel.text = contactModel.friends[selectedIndexPath.row]["email"]!
            cell.notesLabel.text = contactModel.friends[selectedIndexPath.row]["notes"]!
        default:
            break
        }

        return cell
    }


}
