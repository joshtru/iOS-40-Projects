//
//  ViewController.swift
//  TipCalculator
//
//  Created by Joshua Okoro on 2/18/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        subTotalTextField.becomeFirstResponder()
        showToolBar()
    }
    // Model
    var model = Model()
    
    // MARK: - Outlets
    @IBOutlet weak var subTotalTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    @IBOutlet weak var tipSliderValue: UISlider!
    
    // MARK: - Interactions
    @IBAction func tipSlider(_ sender: UISlider) {
        tipLabel.text = "Tip (\(Int(sender.value))%):"
        model.tipSliderFromSlider = Int(sender.value)
        updateLabels()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tipSliderValue.isEnabled = false
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
        
        let clear = UIBarButtonItem(
            title: "Clear",
            style: .done,
            target: self,
            action: #selector(clearField)
        )
        
        // Add Items to Toolbar
        toolbar.setItems([clear, flexibleSpace, doneButton], animated: false)
        
        // Add toolbar to keyboard
        subTotalTextField.inputAccessoryView = toolbar
    }
    
    @objc func clearField() {
        model.subTotalText = "0"
        updateLabels()
        subTotalTextField.text = ""
        tipLabel.text = "Tip (\(Int(tipSliderValue.value))%):"
        
    }
    
    @objc func dismissKeyboard() {
        subTotalTextField.resignFirstResponder()
        tipSliderValue.isEnabled = true
        
        if subTotalTextField.text != nil {
            model.subTotalText = subTotalTextField.text!
            model.tipSliderFromSlider = Int(tipSliderValue.value)
            
            updateLabels()
            
        }
    }
    
    func updateLabels() {
        subTotalTextField.text = model.subtotalAsCurrency
        tipAmountLabel.text = model.tipAmountAsCurrency
        totalAmountLabel.text = model.totalAmountAsCurrency
    }
    
}

