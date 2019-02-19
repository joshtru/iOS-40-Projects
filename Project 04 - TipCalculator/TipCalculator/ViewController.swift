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
        showToolBar()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var subTotalTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    // MARK: - Interactions
    @IBAction func tipSlider(_ sender: UISlider) {
        tipLabel.text = "Tip (\(Int(sender.value))%):"
    }
    
    
    func showToolBar() {
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dismissKeyboard)
        )
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        
        // Add Items to Toolbar
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        // Add toolbar to keyboard
        subTotalTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        subTotalTextField.resignFirstResponder()
    }
    
}

