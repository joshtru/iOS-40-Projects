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
    @IBOutlet weak var textView: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sendMessage = textView.text
    }

}

