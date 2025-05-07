//
//  RockAppListingViewModel.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

final class RockAppListingViewModel: ObservableObject {
    
    @Published private(set) var state: RockAppState = .loading
    @Published private(set) var tracks: [RockTrackScreenDataModel] = []
    
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
            let response = try await service.getTracks(request: request)
            handleResponse(response: response)
            state = .loaded
        } catch {
            state = .error
            // TODO: handle error
        }
    }
    
    private func handleResponse(response: RockAppListingApiResponse?) {
        guard let results = response?.results else {
            return
        }
        let sortedTracks = results.sorted { $0.date ?? Date() > $1.date ?? Date() }
        let tracks: [RockTrackScreenDataModel] = sortedTracks.compactMap { .init(id: $0.trackId ?? 0,
                                                                                 trackName: $0.trackName,
                                                                                 artistName: $0.artistName,
                                                                                 price: $0.formattedTrackPrice,
                                                                                 thumbnailLink: $0.artworkUrl30,
                                                                                 bannerLink: $0.artworkUrl100,
                                                                                 duration: $0.trackTimeMillis,
                                                                                 releaseDate: $0.releaseDate, 
                                                                                 trackViewUrl: $0.trackViewUrl)}
        self.tracks = tracks
    }
}
