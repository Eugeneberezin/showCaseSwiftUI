//
//  AssetTest.swift
//  ShowCaseAppTests
//
//  Created by Eugene Berezin on 1/13/21.
//

import CoreData
import XCTest
@testable import ShowCaseApp

class AssetTest: BaseTestCase {

    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }
    
    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
