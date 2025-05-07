//
//  NetworkManagerMock.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import Foundation
@testable import RockTracks

final class NetworkManagerMock: NetworkManagerProviding {
    var shouldThrowError = false
    var stubbedResource: Any?
    
    func call<R: Decodable>(service request: Requesting) async throws -> R? {
        guard !shouldThrowError else {
            throw NetworkError.badRequest
        }
        return stubbedResource as? R
    }
}
