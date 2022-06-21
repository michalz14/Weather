//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 18/06/2022.
//

import Foundation
import Combine

final class WeatherViewModel: ObservableObject {
    
    private var bag = Set<AnyCancellable>()
    let repository: WeatherRepositoryProtocol
    
    @Published var city: City
    
    @Published var cityName: Just<String>
    @Published var currentWeatherViewModel: CurrentWeatherViewModel?
    @Published var hourlyWeatherViewModel: HourlyViewModel?
    @Published var dailyWeatherViewModel: DailyViewModel?
    
    init(city: City, repository: WeatherRepositoryProtocol) {
        cityName = Just(city.name ?? "")
        self.city = city
        self.repository = repository
        subscribe()
    }
    
    private func subscribe() {
        _city.projectedValue
            .removeDuplicates()
            .sink { _ in
            /* nop */
        } receiveValue: { [weak self] city in
            self?.cityName = Just(city.name ?? "")
            self?.fetchHourlyWeather()
            self?.fetchDailyWeather()
        }
        .store(in: &bag)
    }
    
    private func setupViewModels() {
        if let weather = city.current {
            currentWeatherViewModel = CurrentWeatherViewModel(weather: weather)
        }
        if let hourly = city.hourlyWeather {
            hourlyWeatherViewModel = HourlyViewModel(items: hourly)
        }
        if let daily = city.dailyWeather {
            dailyWeatherViewModel = DailyViewModel(items: daily)
        }
    }
}

extension WeatherViewModel {
    
    func fetchHourlyWeather() {
        repository.hourlyWeather(for: city.coordinates)
            .mapError({ _ in fatalError() })
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { _ in
                /* nop */
            }, receiveValue: { [weak self] city in
                self?.city.current = city.current
                self?.city.hourlyWeather = city.hourlyWeather
                self?.setupViewModels()
            })
            .store(in: &bag)
    }
    
    func fetchDailyWeather() {
         repository.dailyWeather(for: city.coordinates)
            .mapError({ _ in fatalError() })
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { _ in
                /* nop */
            }, receiveValue: { [weak self] city in
                self?.city.dailyWeather = city.dailyWeather
                self?.setupViewModels()
            })
            .store(in: &bag)
    }
}
