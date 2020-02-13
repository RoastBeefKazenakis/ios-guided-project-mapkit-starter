//
//  QuakeTests.swift
//  QuakesTests
//
//  Created by Paul Solt on 10/31/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import XCTest
@testable import Quakes

class QuakeTests: XCTestCase {

    //
    // Use throws so you don't need do/catch
    
    
    func testQuake() throws {
        //
        // Test Driven Developer - TDD
        // Red - Failing Test
        // Green - Passing Test
        // Refactor - Cleanup your mess
        
        let decoder = JSONDecoder()
        
        let quake = try decoder.decode(Quake.self, from: quakeData)
        
        // Assert (Expected, actual)
        XCTAssertEqual(1.29, quake.magnitude, accuracy: 0.00001)
        XCTAssertEqual("10km SSW of Idyllwild, CA", quake.place)
//        XCTAssertEqual(date, quake.time)
        XCTAssertEqual(-116.7776667, quake.longitude, accuracy: 0.001)
        XCTAssertEqual(33.663333299999998, quake.latitude, accuracy: 0.001)

    }

}
