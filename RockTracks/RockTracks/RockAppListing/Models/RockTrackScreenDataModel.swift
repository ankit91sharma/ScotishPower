//
//  RockTrackScreenDataModel.swift
//  RockTracks
//
//  Created by Ankit Sharma on 04/05/25.
//

import Foundation

struct RockTrackScreenDataModel: Identifiable {
    let id: Int
    let trackName: String?
    let artistName: String?
    let price: String?
    let image: String?
    
    var artworkURL: URL? {
        guard let urlString = image else {
            return nil
        }
        return URL(string: urlString)
    }
    
    var displayTrackName: String {
        trackName ?? "-"
    }
    
    var displayArtistName: String {
        artistName ?? "-"
    }
    
    var displayPrice: String {
        price ?? "-"
    }
}
