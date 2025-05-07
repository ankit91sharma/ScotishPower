//
//  RockTrackResponseTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class RockTrackResponseTests: XCTestCase, JsonReadable {
    
    private var sut: RockAppListingApiResponse!
    
    override func setUp() {
        super.setUp()
        sut = loadJSON(.rockTracks)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDate() {
        guard let date = sut.results?.first?.date else {
            XCTFail("Date is empty")
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.longDateTimeZone.rawValue
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let expectedDate = dateFormatter.date(from: "1981-06-03T07:00:00Z")
        XCTAssertEqual(date, expectedDate)
    }
    
    func testFormattedTrackPrice() {
        guard let formattedTrackPrice = sut.results?.first?.formattedTrackPrice else {
            XCTFail("track price is empty")
            return
        }
        XCTAssertEqual(formattedTrackPrice, "$1.29")
    }
}
