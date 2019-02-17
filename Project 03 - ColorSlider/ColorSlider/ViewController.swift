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
    }
    @IBOutlet weak var adjustText: UITextView!
    
    @IBOutlet weak var setRedSlider: UISlider!
    @IBOutlet weak var setGreenSlider: UISlider!
    @IBOutlet weak var setBlueSlider: UISlider!
    @IBOutlet weak var setBrightness: UISlider!
    
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
    
    func adjustTextColor() {
        adjustText.textColor = UIColor(displayP3Red: CGFloat(setRedSlider!.value), green: CGFloat(setGreenSlider.value), blue: CGFloat(setBlueSlider!.value), alpha: CGFloat(setBrightness!.value))
    }
    
    

}

