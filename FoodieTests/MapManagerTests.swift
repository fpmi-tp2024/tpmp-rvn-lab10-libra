//
//  PaymentTests.swift
//  FoodieTests
//
//  Created by lev on 28.05.24.
//

import XCTest
import MapKit
@testable import Foodie

class MapManagerTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetClosestLocations() {
        // 1. Given
        let mm = MapManager()
        let userLocation = CLLocationCoordinate2D(latitude: 53.90222, longitude: 27.54829)

        // 2. When
        let closestLocations = mm.getClosestLocations(userLocation: userLocation)

        // 3. Then
        XCTAssertEqual(closestLocations.count, 1)
        XCTAssertEqual(closestLocations[0].name, "Restaurant #1")
    }

}
