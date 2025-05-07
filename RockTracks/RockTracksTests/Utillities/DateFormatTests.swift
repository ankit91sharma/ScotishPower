//
//  DateFormatTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class DateFormatterUnitTests: XCTestCase {
    
    func testDateFormatRawValues() {
        XCTAssertEqual(DateFormat.longDateTimeZone.rawValue, "yyyy-MM-dd'T'HH:mm:ssZ")
        XCTAssertEqual(DateFormat.shortDate.rawValue, "d MMM yyyy")
    }
    
    func testGetUTCDateWithValidInput() {
        let dateString = "2023-05-15T14:30:00+0000"
        let expectedDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian),
                                                    timeZone: TimeZone(abbreviation: "UTC"),
                                                    year: 2023,
                                                    month: 5,
                                                    day: 15,
                                                    hour: 14,
                                                    minute: 30,
                                                    second: 0)
        
        let date = dateString.getUTCDate()
        XCTAssertNotNil(date)
        XCTAssertEqual(date, expectedDateComponents.date)
    }
    
    func testGetUTCDateWithLongFormatInvalidInput() {
        let date = "2023-05-15 14:30:00".getUTCDate()
        XCTAssertNil(date)
    }
}
