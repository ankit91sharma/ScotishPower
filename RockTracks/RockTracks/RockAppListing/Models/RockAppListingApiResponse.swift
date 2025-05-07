//
//  RockAppListingApiResponse.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

import Foundation

struct RockAppListingApiResponse: Codable {
    let resultCount: Int?
    let results: [RockAppListResults]?
    
    struct RockAppListResults: Codable {
        let wrapperType: String?
        let kind: String?
        let artistId: Int?
        let collectionId: Int?
        let trackId: Int?
        let artistName: String?
        let collectionName: String?
        let trackName: String?
        let collectionPrice: Decimal?
        let trackPrice: Double?
        let currency: String?
        let artworkUrl30: String?
        let artworkUrl60: String?
        let artworkUrl100: String?
        let releaseDate: String?
        let trackTimeMillis: Int?
        let trackViewUrl: String?
        
        var date: Date? {
            releaseDate?.getUTCDate()
        }
        
        var formattedTrackPrice: String? {
            guard let price = trackPrice, let currency = currency else { return nil }
            return price.getformatted(for: currency)
        }
    }
}

