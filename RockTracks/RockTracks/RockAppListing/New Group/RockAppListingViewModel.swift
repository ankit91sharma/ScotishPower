//
//  RockAppListingViewModel.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

final class RockAppListingViewModel: ObservableObject {
    @Published private(set) var state: RockAppState = .loading
    
    private let service: RockAppListingProviding
    
    init(service: RockAppListingProviding) {
        self.service = service
    }
}

// MARK: API
extension RockAppListingViewModel {
    
    @MainActor
    func fetchTracks() async {
        state = .loading
        do {
            let request = RockTrackRequest(type: "rock")
            _ = try await service.getTracks(request: request)
            state = .loaded
        } catch {
            state = .error
            // TODO: handle error
        }
    }
}
