//
//  ViewController.swift
//  DateAndTime
//
//  Created by Joshua Okoro on 2/20/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getDateAndTime()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Interactions
    @IBAction func refreshDateAndTimeButton(_ sender: UIButton) {
        getDateAndTime()
    }
    
    // MARK: - Function
    func getDateAndTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        
        let date = Date()
        
        dateLabel.text = dateFormatter.string(from: date)
        timeLabel.text = timeFormatter.string(from: date)
    }

}

