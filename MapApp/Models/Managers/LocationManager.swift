//
//  LocationManager.swift
//  MapApp
//
//  Created by Mac-aroni on 1/9/23.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 5, longitude: 5), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkIfLocationServicesIsEnabled() {
        print("STAGE 1")
        if CLLocationManager.locationServicesEnabled() {
            print("STAGE 2")
            locationManager.delegate = self
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        } else {
            print("STAGE 3")
            // show and alert letting them know this is off
        }
    }
    
    private func checkLocationAuthorization() {switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted due to parental controls.")
            case .denied:
                print("You have denied this app location permission.")
            case .authorizedAlways, .authorizedWhenInUse:
                region.center = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
                print("---------------------" ,locationManager.location?.coordinate.latitude, locationManager.location?.coordinate.longitude)
            @unknown default:
                break
        }
    }
    
    func center (to stop: Stop) {
        region.center = CLLocationCoordinate2D(latitude: stop.location.coordinate.latitude, longitude: stop.location.coordinate.longitude)
    }
    
    func distanceFrom(from stop: Stop) -> Double {
        let distance = (locationManager.location?.distance(from: (stop.location)) ?? -1.0)
        print(distance, locationManager.location?.coordinate, stop.location.coordinate)
        return distance / 1000.0
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
        print("Updated location")
        print("#############", userLocation?.coordinate)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
