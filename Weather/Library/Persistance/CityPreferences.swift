//
//  CityPreferences.swift
//  Weather
//
//  Created by Michał Zieliński on 21/06/2022.
//

import Foundation
import Combine

protocol CityPreferencesType: AnyObject {
    var savedCity: AnyPublisher<String?, Never> { get }
    
    func save(cityName: String)
}

private struct CityPreferencesKeys {
    static let mainCity = "savedCityName"
}

final class CityPreferences: CityPreferencesType {
    
    private let userDefaults = UserDefaults(suiteName: "CityPreferencesName")
    
    func save(cityName: String) {
        userDefaults?.set(cityName, forKey: CityPreferencesKeys.mainCity)
    }

    var savedCity: AnyPublisher<String?, Never> {
        userDefaults!.publisher(for: \.savedCityName).eraseToAnyPublisher()
    }
}

private extension UserDefaults {
    @objc dynamic var savedCityName: String? {
        return string(forKey: CityPreferencesKeys.mainCity)
    }
}
