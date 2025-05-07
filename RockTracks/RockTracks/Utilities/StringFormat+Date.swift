//
//  StringFormat+Date.swift
//  RockTracks
//
//  Created by Ankit Sharma on 07/05/25.
//

import Foundation

extension Date {
    
    func toString(format: DateFormat = .longDateTimeZone) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
