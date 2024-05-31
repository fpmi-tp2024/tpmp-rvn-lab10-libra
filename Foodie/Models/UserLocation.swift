//
//  UserLocation.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import Foundation
import CoreLocation

// MARK: - Location model structure

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
