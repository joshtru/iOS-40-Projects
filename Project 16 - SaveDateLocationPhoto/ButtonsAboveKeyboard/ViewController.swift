//
//  ViewController.swift
//  SaveDateLocationPhoto
//
//  Created by Joshua Okoro on 3/1/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputAccessoryView = toolbar
        textView.becomeFirstResponder()
        locationManager.delegate = self
        getCurrentDateAndTime()
        
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
        getLocation()
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
    
    // MARK: - Core Location
    let locationManager = CLLocationManager()
    
    
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if let placemarkData = placemarks {
                let locationData = placemarkData[0]
                let city = locationData.locality!
                let state = locationData.administrativeArea!
                let country = locationData.isoCountryCode!
                let zipCode = locationData.postalCode!
                let location = "\(city), \(state) \(zipCode), \(country)"
                self.locationLabel.text = location
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
            }
        }
    }
    
    // MARK: - Date And Time
    func getCurrentDateAndTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "MMMM d, yyyy 'at' h:mm a"
        dateLabel.text = dateFormatter.string(from: Date())
    }
    
    
    
}

