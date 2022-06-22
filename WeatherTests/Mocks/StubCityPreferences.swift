//
//  StubCityPreferences.swift
//  WeatherTests
//
//  Created by Michał Zieliński on 22/06/2022.
//

import Combine
@testable import Weather

class StubCityPreferences: CityPreferencesType {
    
    var savedCount = 0
    var isCityEmpty = false
    
    
    lazy var savedCity: AnyPublisher<String?, Never> = self.cityPublisher()
    
    func save(cityName: String) {
        savedCount += 1
    }
    
    private func cityPublisher() -> AnyPublisher<String?, Never> {
        if isCityEmpty {
            return Just(nil).eraseToAnyPublisher()
        } else {
            return Just("Warsaw").eraseToAnyPublisher()
        }
    }
}
