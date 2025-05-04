//
//  Requests.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

enum RequestType: String {
    case GET
}

protocol Requesting {
    var requestType: RequestType { get }
    var requestUrl: String { get }
    var parser: Parseable { get }
}

extension Requesting {
    
    var baseUrl: String {
        "https://itunes.apple.com/"
    }
    
    var parser: Parseable {
        Parser()
    }
}
