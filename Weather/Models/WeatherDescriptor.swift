//
//  WeatherDescriptor.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct WeatherDescriptor: Decodable {
    var description: String?
    var icon: String?
    var id: Int?
    var main: String?
}
