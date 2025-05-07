//
//  RockAppListingViewModelTests.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 08/05/25.
//

import XCTest
@testable import RockTracks

final class RockAppListingViewModelTests: XCTestCase {
    
    private var sut: RockAppListingViewModel!
    private var service: RockAppListingService!
    private var networkManager: NetworkManagerMock!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManagerMock()
        service = RockAppListingService(networkManager: networkManager)
        sut = .init(service: service)
    }
    
    override func tearDown() {
        networkManager = nil
        service = nil
        sut = nil
        super.tearDown()
    }
}

extension RockAppListingViewModelTests {
    
    func testFetchTracks_returnsSuccess() async {
        await sut.fetchTracks()
        guard case .loaded = sut.state else {
            XCTFail("Expected state to be success")
            return
        }
        XCTAssert(true)
    }
    
    func testFetchTracks_returnsError() async {
        networkManager.shouldThrowError = true
        await sut.fetchTracks()
        guard case .error = sut.state else {
            XCTFail("Expected state to be success")
            return
        }
        XCTAssert(true)
    }
}
