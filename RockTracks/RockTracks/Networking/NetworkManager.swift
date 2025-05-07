//
//  NetworkManager.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

protocol NetworkManagerProviding {
    func call<R: Decodable>(service request: Requesting) async throws -> R?
}

final class NetworkManager: NetworkManagerProviding {
    
    func call<R: Decodable>(service request: Requesting) async throws -> R? {
        guard let url =  URL(string: request.requestUrl) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return request.parser.parse(data)
    }
}
