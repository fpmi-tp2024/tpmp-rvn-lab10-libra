//
//  MapManager.swift
//  Foodie
//
//  Created by Vasily on 27.05.24.
//

import MapKit

final class MapManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // MARK: - MapManager variables
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.89580, longitude: 27.55898), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @Published var userLocation: CLLocationCoordinate2D? = nil
    
    private let locations = [Location(name: "Restaurant #1", coordinate: CLLocationCoordinate2D(latitude: 53.90222, longitude: 27.54829)), Location(name: "Restaurant #2", coordinate: CLLocationCoordinate2D(latitude: 53.89206, longitude: 27.55114)), Location(name: "Restaurant #3", coordinate: CLLocationCoordinate2D(latitude: 53.93004, longitude: 27.57754))]

    
    var locationManager: CLLocationManager?
    
    // MARK: - MapManager methods for checking accessibility
    
    func checkIfLocationServicesEnabled() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager!.startUpdatingLocation()
        }
        else {
            
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        self.userLocation = userLocation.coordinate
        self.region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    // MARK: - MapManager methods for fetching locations
    
    func getClosestLocations(userLocation: CLLocationCoordinate2D) -> [Location] {
        var distances: [CLLocationDistance] = []
        let user = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        
        for location in locations {
            let location2 = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            distances.append(user.distance(from: location2))
        }

        var closestLocations: [Location] = []
        
        for location in locations {
            if (user.distance(from: CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)) == distances.min()) {
                closestLocations.append(location)
            }
        }
        
        return closestLocations
    }
}
