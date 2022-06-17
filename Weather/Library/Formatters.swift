//
//  Formatters.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct Formatters {
    struct Temperature {
        static func celsius(_ value: Int) -> String {
            return "\(value)°C"
        }
    }
}
