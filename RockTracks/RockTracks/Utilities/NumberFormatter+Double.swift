//
//  NumberFormatter+Double.swift
//  RockTracks
//
//  Created by Ankit Sharma on 06/05/25.
//

import Foundation

extension Double {
    
    func getformatted(for currency: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        return formatter.string(from: NSNumber(value: self))
    }
}
