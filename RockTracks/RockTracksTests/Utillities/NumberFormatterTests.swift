//
//  NumberFormatterTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class NumberFormatterTests: XCTestCase {

    func testgetFormatted() {
           let formatted = 1234.56.getformatted(for: "GBP")
           XCTAssertEqual(formatted, "£1,234.56")
       }
}
