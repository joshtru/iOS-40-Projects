//
//  ViewController.swift
//  SaveDateLocationPhoto
//
//  Created by Joshua Okoro on 3/1/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputAccessoryView = toolbar
        textView.becomeFirstResponder()
        
    }
    // MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet var toolbar: UIView!
    
    // MARK: - Interactions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
    }
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    
    
}

