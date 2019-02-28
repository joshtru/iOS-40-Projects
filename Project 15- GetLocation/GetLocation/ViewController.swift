//
//  ViewController.swift
//  GetLocation
//
//  Created by Joshua Okoro on 2/28/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let locationManager = CLLocationManager()
    
    // MARK: - Outlets
    @IBOutlet var locationLabel: UILabel!
    

    // MARK: - Interactions
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        getLocation()
    }
    
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if let placemarkData = placemarks {
                let locationData = placemarkData[0]
                print(locationData)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
}

