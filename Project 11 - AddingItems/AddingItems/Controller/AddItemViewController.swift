//
//  AddItemViewController.swift
//  AddingItems
//
//  Created by Joshua Okoro on 2/24/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

protocol AddItem {
    func newItem(data: String)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddItem? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
    }
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Interactions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if textView.text.count > 0 {
            delegate?.newItem(data: textView.text!)
        }
        let _ = navigationController?.popViewController(animated: true)
    }
    
}
