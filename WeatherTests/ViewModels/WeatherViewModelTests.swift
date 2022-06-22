//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Michał Zieliński on 22/06/2022.
//

import XCTest
import Combine
@testable import Weather

class WeatherViewModelTests: XCTestCase {

    private var sut: WeatherViewModel!
    private var repository: StubWeatherRepository!
    
    override func setUp() {
        repository = StubWeatherRepository()
        sut = WeatherViewModel(city: City.load,
                               repository: repository)
    }
    
    func testFetchingRepository() {
        sut.fetchDailyWeather()
        sut.fetchHourlyWeather()
        
        XCTAssertNotNil(sut.currentWeatherViewModel, "Current weather View model should be not empty after weather response")
        XCTAssertNotNil(sut.hourlyWeatherViewModel, "Hourly weather View model should be not empty after weather response")
        XCTAssertNotNil(sut.dailyWeatherViewModel, "Daily weather View model should be not empty after weather response")
    }
}
