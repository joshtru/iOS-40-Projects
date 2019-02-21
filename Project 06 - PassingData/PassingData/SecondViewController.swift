//
//  SecondViewController.swift
//  PassingData
//
//  Created by Joshua Okoro on 2/21/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

// MARK: - Protocol For Sending Message
protocol MessageSecondView {
    func messageFunction(data: String)
}


class SecondViewController: UIViewController {
    
    var delegate: MessageSecondView?
    
    var message: String?
    
 // MARK: - Outlets
    @IBOutlet weak var messageDisplay: UITextView!
    
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageDisplay.text = message
    }
    
    // MARK: - Interactions
    

    @IBAction func replyButton(_ sender: UIButton) {
        delegate?.messageFunction(data: messageField.text!)
        dismiss(animated: true, completion: nil)
    }
    
}
