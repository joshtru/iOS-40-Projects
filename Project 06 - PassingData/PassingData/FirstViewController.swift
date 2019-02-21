//
//  FirstViewController.swift
//  PassingData
//
//  Created by Joshua Okoro on 2/21/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.message = textView.text
        }
    }
    
    // MARK: - Interactions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "secondView", sender: self)
    }
    
}

