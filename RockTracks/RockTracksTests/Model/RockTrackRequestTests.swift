//
//  RockTrackRequestTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class RockTrackRequestTests: XCTestCase {
    
    func testRequestUrl() {
        XCTAssertEqual(RockTrackRequest(type: "rock").requestUrl, "https://itunes.apple.com/search?term=rock")
    }
}
