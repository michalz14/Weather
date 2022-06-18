//
//  Loader.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

final class CityLoader {
    
    func loadCities() -> [City] {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "cities", ofType: "json") else {
            fatalError("cities.json not found")
        }
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert cities.json to String")
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert cities.json to Data")
        }
        
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode([City].self, from: jsonData)
        } catch {
            fatalError("Unable to decode cities")
            
        }
    }
}

final class WeatherLoader {
    
    func loadWeather() -> City {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "weather", ofType: "json") else {
            fatalError("cities.json not found")
        }
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert cities.json to String")
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert cities.json to Data")
        }
        
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(City.self, from: jsonData)
        } catch {
            fatalError("Unable to decode cities")
        }
    }
}

