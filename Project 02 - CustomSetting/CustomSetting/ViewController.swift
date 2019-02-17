//
//  ViewController.swift
//  CustomSetting
//
//  Created by Joshua Okoro on 2/16/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
        
        // Get Initial settings at first load
        detectIfSettingsChanged()
        
        // Listen for changes in settings
        NotificationCenter.default.addObserver(self, selector: #selector(detectIfSettingsChanged), name: UserDefaults.didChangeNotification, object: nil)
        
        
    }
    
    @IBOutlet weak var textView: UITextView!
    
    // Variable used by status bar
    var nightMode: Bool = false
    
    // Detect for night mode settings
    @objc func detectIfSettingsChanged() {
        if UserDefaults.standard.bool(forKey: "nightMode") {
            view.backgroundColor = UIColor.black
            textView.keyboardAppearance = .dark
            textView.textColor = UIColor.white
            nightMode = true
        } else {
            view.backgroundColor = UIColor.white
            textView.keyboardAppearance = .default
            textView.textColor = UIColor.black
            setNeedsStatusBarAppearanceUpdate()
            nightMode = false
        }
        
    }
    
    // Change status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if nightMode {
            return .lightContent
        }
        return .default
    }
    
    

}

