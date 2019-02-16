//
//  ViewController.swift
//  TapCounter
//
//  Created by Joshua Okoro on 2/16/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    // MARK: - Labels
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: - Variables
    var counter = 0
    
    // MARK: - Buttons and Interactions
    @IBAction func countButtonPressed(_ sender: UIButton) {
        increment()
    }
    
    @IBAction func restCounterPressed(_ sender: UIBarButtonItem) {
        countLabel.text = "0"
        counter = 0
    }
    
    @IBAction func tapButtonLongPressed(_ sender: UILongPressGestureRecognizer) {
        increment()
    }
    
    // MARK: - Functions
    func increment() {
        counter += 1
        countLabel.text = String(counter)
    }
    
}

