//
//  FirstViewController.swift
//  PassingData
//
//  Created by Joshua Okoro on 2/21/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, MessageSecondView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageField.becomeFirstResponder()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var textMessage: UITextView!
    
    @IBOutlet weak var messageField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondView" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.message = messageField.text!
            destinationVC.delegate = self
        }
    }
    
    
    
    // MARK: - Interactions

    @IBAction func sendMessageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ToSecondView", sender: self)
    }
    
    
    // MARK: - Protocol Sub
    func messageFunction(data: String) {
        // Assign textView with message from second view controller
        textMessage.text = data
        messageField.text = ""
    }
}

