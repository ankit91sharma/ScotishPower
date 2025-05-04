//
//  Parser.swift
//  RockTracks
//
//  Created by Ankit Sharma on 03/05/25.
//

import Foundation

protocol Parseable {
    func parse<T: Decodable>(_ data: Data) -> T?
}

final class Parser: Parseable {
    
    func parse<T: Decodable>(_ data: Data) -> T? {
        do {
            let decodeData = try JSONDecoder().decode(T.self, from: data) as T
            return decodeData
        } catch let error as NSError {
            print("error parsing data: \(error.debugDescription)")
            return nil
        }
    }
}
