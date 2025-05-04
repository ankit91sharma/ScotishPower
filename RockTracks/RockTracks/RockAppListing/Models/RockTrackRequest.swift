//
//  RockTrackRequest.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

struct RockTrackRequest: Requesting {
    var requestType: RequestType = .GET
    private(set) var requestUrl: String = "search?term={type}"
    
    init(type: String) {
        let url = requestUrl.replacingOccurrences(of: "{type}", with: type)
        requestUrl = baseUrl + url
    }
}
