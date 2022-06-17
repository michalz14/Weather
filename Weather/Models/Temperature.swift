//
//  Temperature.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct Temperature: Decodable {
    var day: Double
    var eve: Double
    var max: Double
    var min: Double
    var morn: Double
    var night: Double
}
