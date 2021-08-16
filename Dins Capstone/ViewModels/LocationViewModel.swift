//
//  LocationViewModel.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/14/21.
//

import Foundation
import CoreLocation

class locationViewModel: NSObject, ObservableObject {
    
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension locationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
    }
    
}
