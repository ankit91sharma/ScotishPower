//
//  RockTrackScreenDataModelTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import XCTest
@testable import RockTracks

final class RockTrackScreenDataModelTests: XCTestCase, JsonReadable {
    
    private var sut: RockTrackScreenDataModel!
    
    override func setUp() {
        super.setUp()
        let response: RockAppListingApiResponse? = loadJSON(.rockTracks)
        let first = response?.results?.first
        sut = .init(id: first?.trackId ?? 0,
                    trackName: first?.trackName,
                    artistName: first?.artistName,
                    price: first?.formattedTrackPrice,
                    thumbnailLink: first?.artworkUrl30,
                    bannerLink: first?.artworkUrl100,
                    duration: first?.trackTimeMillis,
                    releaseDate: first?.releaseDate,
                    trackViewUrl: first?.trackViewUrl)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

extension RockTrackScreenDataModelTests {
    
    func testThumbnailURL() {
        XCTAssertEqual(sut.thumbnailURL?.absoluteString, "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/71/2d/61/712d617d-f4a4-5904-1b11-d4b4b45c47c5/828768588925.jpg/30x30bb.jpg")
    }
    
    func testBannerLinkURL() {
        XCTAssertEqual(sut.bannerLinkURL?.absoluteString, "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/71/2d/61/712d617d-f4a4-5904-1b11-d4b4b45c47c5/828768588925.jpg/100x100bb.jpg")
    }
    
    func testDisplayTrackName() {
        XCTAssertEqual(sut.displayTrackName, "Don't Stop Believin' (2024 Remaster)")
    }
    
    func testDisplayArtistName() {
        XCTAssertEqual(sut.displayArtistName, "Journey")
    }
    
    func testDisplayPrice() {
        XCTAssertEqual(sut.displayPrice, "$1.29")
    }
    
    func testFormattedDuration() {
        XCTAssertEqual(sut.formattedDuration, "4:10 minutes")
    }
    
    func testDisplayDate() {
        XCTAssertEqual(sut.displayDate, "3 Jun 1981")
    }
}
