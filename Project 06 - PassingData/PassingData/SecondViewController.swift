//
//  SecondViewController.swift
//  PassingData
//
//  Created by Joshua Okoro on 2/21/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    var message: String?
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message ?? "No Message"
    }
    

}
