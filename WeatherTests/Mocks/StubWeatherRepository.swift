//
//  StubWeatherRepository.swift
//  WeatherTests
//
//  Created by Michał Zieliński on 22/06/2022.
//

import Combine
@testable import Weather

class StubWeatherRepository: WeatherRepositoryProtocol {
    
    func hourlyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error> {
        Just(City.load)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func dailyWeather(for coordinates: Coordinates) -> AnyPublisher<City, Error> {
        Just(City.load)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
