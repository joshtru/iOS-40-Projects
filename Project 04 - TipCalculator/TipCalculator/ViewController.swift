//
//  ViewController.swift
//  TipCalculator
//
//  Created by Joshua Okoro on 2/18/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        subTotalTextField.becomeFirstResponder()
    }

    @IBOutlet weak var subTotalTextField: UITextField!
    
}

