//
//  PlacesTableViewController.swift
//  StickyHeadersAndJumpBar
//
//  Created by Joshua Okoro on 2/25/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    let sectionContent = placesInstance.places.keys.sorted()
    let rowContent = placesInstance.places.values

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    // MARK: - Table view data source

    // Return number of Section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionContent.count
    }

    // Return number of Row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sectionContent[section]
        return placesInstance.places[letter]?.count ?? 1
    }

    // Display Row Content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath)
        
        let letter = sectionContent[indexPath.section]
        
        cell.textLabel?.text = placesInstance.places[letter]?[indexPath.row]

        return cell
    }
    
    // Jumper Menu
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionContent
    }
    
    // Display Section Menu
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionContent[section]
    }

}
