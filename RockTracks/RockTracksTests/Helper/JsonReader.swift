//
//  JsonReader.swift
//  RockTracksTests
//
//  Created by Ankit Sharma on 07/05/25.
//

import Foundation
import XCTest

enum FileName: String {
    case rockTracks = "RockTracks"
}

protocol JsonReadable where Self: XCTestCase {
    func loadJSON<T: Decodable>(_ filename: FileName) -> T?
}

extension JsonReadable {
    func loadJSON<T: Decodable>(_ filename: FileName) -> T? {
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: filename.rawValue, withExtension: "json") else {
            print("Couldn't find \(filename) in main bundle.")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Couldn't parse \(filename) as \(T.self):\n\(error)")
            return nil
        }
    }
}
