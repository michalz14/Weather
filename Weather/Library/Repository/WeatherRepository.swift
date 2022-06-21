//
//  WeatherRepository.swift
//  Weather
//
//  Created by Michał Zieliński on 18/06/2022.
//

import Foundation
import Combine

protocol WeatherRepositoryProtocol: AnyObject {
    func hourlyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error>
    func dailyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error>
}

final class WeatherRepository: WeatherRepositoryProtocol {
    
    struct APIBase {
        static let apiKey = "b191d7ca9c643a041efbd299efcd44f6o"
        static let basePath = "https://api.openweathermap.org/data/2.5/onecall"
    }
    
    func hourlyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error> {
        let request = WeatherTarget.hourly(coordinates: coordinates).request
        return run(request!)
        
    }
    
    func dailyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error> {
        let request = WeatherTarget.daily(coordinates: coordinates).request
        return run(request!)
    }
    
    private func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .handleEvents(receiveOutput: { print(NSString(data: $0, encoding: String.Encoding.utf8.rawValue)!) })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
