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
    let thumbnailLink: String?
    let bannerLink: String?
    let duration: Int?
    let releaseDate: String?
    let trackViewUrl: String?
    
    var thumbnailURL: URL? {
        guard let urlString = thumbnailLink else {
            return nil
        }
        return URL(string: urlString)
    }
    
    var bannerLinkURL: URL? {
        guard let urlString = bannerLink else {
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
    
    var formattedDuration: String {
        guard let duration else  {
            return "-"
        }
        let totalSeconds = duration / 1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d minutes", minutes, seconds)
    }
    
    
    var displayDate: String {
        guard let releaseDate,
              let displayDate = releaseDate.getUTCDate()?.toString(format: .shortDate) else  {
            return "-"
        }
        return displayDate
    }
}
