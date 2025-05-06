//
//  DateFormatter+String.swift
//  RockTracks
//
//  Created by Ankit Sharma on 06/05/25.
//

import Foundation

enum DateFormat: String {
    case longDateTimeZone = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension String {
    
    func getUTCDate(format: DateFormat = .longDateTimeZone) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: self)
        return date
    }
}
