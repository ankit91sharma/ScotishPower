//
//  StringFormatTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class StringFormatTests: XCTestCase {

    func testToStringWithDefaultFormat() {
        let components = DateComponents(calendar: Calendar(identifier: .gregorian),
                                        timeZone: TimeZone(abbreviation: "UTC"),
                                        year: 2023,
                                        month: 5,
                                        day: 15)
        let testDate = components.date
        let result = testDate?.toString(format: .shortDate)
        XCTAssertEqual(result, "15 May 2023")
    }
}
