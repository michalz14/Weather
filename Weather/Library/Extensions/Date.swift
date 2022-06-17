//
//  Date.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

enum DateStringFormat: String {
    case fullDate = "dd.MM.yyyy"
    case time = "HH:mm"
    case weekday = "EEEE"
}

extension Date {
    func stringFormat(_ format: DateStringFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}


extension Int64 {
    var date: Date {
        Date(timeIntervalSince1970: Double(self))
    }
}
