//
//  RockAppListingService.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

protocol RockAppListingProviding {
    func getTracks(request: Requesting) async throws -> RockAppListingApiResponse?
}

final class RockAppListingService: RockAppListingProviding {
    
    private let networkManager: NetworkManagerProviding
    
    init(networkManager: NetworkManagerProviding = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getTracks(request: Requesting) async throws -> RockAppListingApiResponse? {
        try await networkManager.call(service: request)
    }
}
