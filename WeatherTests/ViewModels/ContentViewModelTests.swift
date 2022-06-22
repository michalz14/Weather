//
//  ContentViewModelTests.swift
//  WeatherTests
//
//  Created by Michał Zieliński on 22/06/2022.
//

import XCTest
import Combine
@testable import Weather

class ContentViewModelTests: XCTestCase {

    private var sut: ContentViewModel!
    private var preferences: StubCityPreferences!
    
    func testCityState() {
        preferences = StubCityPreferences()
        preferences.isCityEmpty = true
        sut = ContentViewModel(preferencesType: preferences)
        XCTAssertEqual(sut.state.rawValue(), 2, "Invalid State. Should be equal to 2, but its sut.state.rawValue()")
    }
    
    func testWeatherState() {
        preferences = StubCityPreferences()
        preferences.isCityEmpty = false
        sut = ContentViewModel(preferencesType: preferences)
        XCTAssertEqual(sut.state.rawValue(), 1, "Invalid State. Should be equal to 1, but its sut.state.rawValue()")
    }
    
    func testWeatherStateAfterSaving() {
        preferences = StubCityPreferences()
        preferences.isCityEmpty = true
        sut = ContentViewModel(preferencesType: preferences)
        preferences.save(cityName: "Poznan")
        
        XCTAssertEqual(sut.state.rawValue(), 1, "Invalid State. Should be equal to 1, but its sut.state.rawValue()")
    }
    
}

private extension ContentViewModel.State {
    func rawValue() -> Int {
        switch self {
        case .idle:
            return 0
        case .weather:
            return 1
        case .chooseCity:
            return 2
        }
    }
}
