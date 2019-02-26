//
//  ViewController.swift
//  CircularImage
//
//  Created by Joshua Okoro on 2/26/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        imageLayout()
        
    }

    // MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    
    
    func imageLayout() {
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.masksToBounds = true
    }
    
    
    
    // MARK: - Interactions
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        if imageButton.titleLabel?.text == "Circular Image" {
            imageButton.setTitle("Square Image", for: .normal)
            profileImage.layer.cornerRadius = 0
            profileImage.layer.masksToBounds = false
            profileImage.layer.borderColor = nil
            profileImage.layer.borderWidth = 0
        } else {
            imageButton.setTitle("Circular Image", for: .normal)
            imageLayout()
        }
    }
    
}

