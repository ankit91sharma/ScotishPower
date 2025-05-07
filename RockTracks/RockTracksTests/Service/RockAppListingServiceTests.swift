//
//  RockAppListingServiceTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 08/05/25.
//

import XCTest
@testable import RockTracks

final class RockAppListingServiceTests: XCTestCase, JsonReadable {
    
    func testGetTracks() async {
        let networkManagerMock = NetworkManagerMock()
        let response: RockAppListingApiResponse? = loadJSON(.rockTracks)
        networkManagerMock.stubbedResource = response
        let sut = RockAppListingService(networkManager:  networkManagerMock)
        let request = RockTrackRequest(type: "rock")
        let tracks = try? await sut.getTracks(request: request)
        XCTAssertEqual(tracks?.resultCount, 54)
    }
}
