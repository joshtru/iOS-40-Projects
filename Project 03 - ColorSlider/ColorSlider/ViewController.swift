//
//  ViewController.swift
//  ColorSlider
//
//  Created by Joshua Okoro on 2/17/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        adjustTextColor()
        nightModeSwitch.setOn(false, animated: true)
        nightModeSwitch.tintColor = UIColor.black
        nightModeSwitch.onTintColor = UIColor.darkGray
    }
    @IBOutlet weak var adjustText: UITextView!
    
    @IBOutlet weak var setRedSlider: UISlider!
    @IBOutlet weak var setGreenSlider: UISlider!
    @IBOutlet weak var setBlueSlider: UISlider!
    @IBOutlet weak var setBrightness: UISlider!
    
    // MARK: - Slider Buttons
    @IBAction func redSlider(_ sender: UISlider) {
        setRedSlider.value = sender.value
        adjustTextColor()
        
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        setGreenSlider.value = sender.value
        adjustTextColor()
    }
    
    
    @IBAction func blueSlider(_ sender: UISlider) {
        setBlueSlider.value = sender.value
        adjustTextColor()
    }
    
    @IBAction func brightnessSlider(_ sender: UISlider) {
        setBrightness.value = sender.value
        adjustTextColor()
    }
    
    // MARK: - Adjust Text Color Function
    func adjustTextColor() {
        adjustText.textColor = UIColor(displayP3Red: CGFloat(setRedSlider!.value), green: CGFloat(setGreenSlider.value), blue: CGFloat(setBlueSlider!.value), alpha: CGFloat(setBrightness!.value))
    }
    
    @IBOutlet weak var nightModeLable: UILabel!
    @IBOutlet weak var nightModeSwitch: UISwitch!
    
    @IBAction func toggleNightMode(_ sender: UISwitch) {
        nightMode(night: sender.isOn)
    }
    
    var nightModeCheck: Bool = false
    
    
    // MARK: - Night Mode Function
    func nightMode(night: Bool) {
        if night {
            nightModeCheck = true
            nightModeLable.textColor = UIColor.white
            view.backgroundColor = UIColor.black
            setBrightness.thumbTintColor = UIColor.white
            setBrightness.maximumTrackTintColor = UIColor.white
            nightModeLable.text = "Night Mode: ON"
        } else {
            nightModeCheck = false
            nightModeLable.textColor = UIColor.black
            view.backgroundColor = UIColor.white
            setBrightness.thumbTintColor = UIColor.black
            setBrightness.maximumTrackTintColor = UIColor.black
            nightModeLable.text = "Night Mode: OFF"
            
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if nightModeCheck {
            return .lightContent
        } else {
            return .default
        }
    }

}

