//
//  InfoCardTableViewCell.swift
//  Contacts
//
//  Created by Joshua Okoro on 2/26/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class InfoCardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.layer.masksToBounds = true
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    
}
