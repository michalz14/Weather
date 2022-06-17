//
//  Weather.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

enum WeatherType: String {
    case hourly, daily, current
}

struct Weather: Decodable {
    enum WeatherKeys: String, CodingKey {
        case dt, weather, clouds, wind_speed, temp, humidity, pressure
    }
    
    var clouds: Double = 0.0
    var datestamp: Int64 = 0
    var humidity: Double = 0.0
    var pressure: Double = 0.0
    var wind: Double = 0.0
    var currentTemperature: Double?
    var descriptor: [WeatherDescriptor]?
    var temperature: Temperature?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherKeys.self)
        datestamp = try container.decode(Int64.self, forKey: WeatherKeys.dt)
        descriptor = try container.decodeIfPresent([WeatherDescriptor].self, forKey: WeatherKeys.weather)
        clouds = try container.decode(Double.self, forKey: WeatherKeys.clouds)
        wind = try container.decode(Double.self, forKey: WeatherKeys.wind_speed)
        humidity = try container.decode(Double.self, forKey: WeatherKeys.humidity)
        pressure = try container.decode(Double.self, forKey: WeatherKeys.pressure)
        guard let codePath = decoder.codingPath.first?.stringValue,
            let weatherType = WeatherType(rawValue: codePath) else { return  }
        switch weatherType {
        case .daily:
            temperature = try container.decode(Temperature.self, forKey: WeatherKeys.temp)
        default:
            currentTemperature = try container.decode(Double.self, forKey: WeatherKeys.temp)
        }
    }
    
    init() { }
}
