//
//  LocationService.swift
//  MyProject
//
//  Created by Марк on 19.06.23.
//

import CoreLocation

class LocationService: NSObject {
    
    static let shared = LocationService()
    
    lazy var manager = CLLocationManager()
    var location =  CLLocation()
  
    var locationDidChangeClosure: ((String) -> Void)?
    
    func getLocation(locationDidChange: ((String) -> Void)?) {
        locationDidChangeClosure = locationDidChange
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined, .restricted, .denied:
            break
            
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error  as? CLError, error.code == .denied {
            manager.stopUpdatingLocation()
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        resolveLocationName(with: location, complition: { [weak self] locationName in
            self?.locationDidChangeClosure?(locationName)
        })
    }
    
    func resolveLocationName(with location: CLLocation, complition: @escaping ((String) -> Void )) {
        let coder = CLGeocoder()
        coder.reverseGeocodeLocation(location) { [weak self] placemarks, _ in
            let name = placemarks?.first?.locality ?? "Minsk"
            complition(name)
        }
    }
}


