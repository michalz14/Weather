//
//  City.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct City: Decodable {
    
    enum CityKeys: String, CodingKey {
        case geonameId, name, lat, lon, country, current, daily, hourly
    }
    
    var country: String?
    var id: Int64?
    var coordinates: Coordinates
    var name: String?
    var dailyWeather: [Weather]?
    var hourlyWeather: [Weather]?
    var current: Weather?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CityKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: CityKeys.name)
        id = try container.decodeIfPresent(Int64.self, forKey: CityKeys.geonameId)
        country = try container.decodeIfPresent(String.self, forKey: CityKeys.country)
        coordinates = Coordinates()
        coordinates.latitude = try container.decode(Double.self, forKey: CityKeys.lat)
        coordinates.longitude = try container.decode(Double.self, forKey: CityKeys.lon)
        current = try container.decodeIfPresent(Weather.self, forKey: CityKeys.current)
        dailyWeather = try container.decodeIfPresent([Weather].self, forKey: CityKeys.daily)
        hourlyWeather = try container.decodeIfPresent([Weather].self, forKey: CityKeys.hourly)
    }
}

struct Coordinates {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
}
