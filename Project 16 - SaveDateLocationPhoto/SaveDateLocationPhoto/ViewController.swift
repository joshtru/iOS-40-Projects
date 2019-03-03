//
//  ViewController.swift
//  SaveDateLocationPhoto
//
//  Created by Joshua Okoro on 3/1/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputAccessoryView = toolbar
        textView.becomeFirstResponder()
        
    }
    // MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet var toolbar: UIView!
    
    // MARK: - Interactions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    // MARK: - Image Picker
    let imagePicker = UIImagePickerController()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            cameraImage.image = selectedImage
            dismiss(animated: true, completion: nil)
            textView.becomeFirstResponder()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        textView.becomeFirstResponder()
    }
    
    
    
}

