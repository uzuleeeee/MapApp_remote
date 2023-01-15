//
//  LocationManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var userLocation: Location = Location(latitude: 0, longitude: 0)
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.89), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.allowsBackgroundLocationUpdates = true
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            // show and alert letting them know this is off
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted due to parental controls.")
            case .denied:
                print("You have denied this app location permission.")
            case .authorizedAlways, .authorizedWhenInUse:
                region.center = locationManager.location!.coordinate
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
