//
//  ContentViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 21/06/2022.
//

import Foundation
import Combine

class ContentViewModel {
    
    private var bag = Set<AnyCancellable>()
    @Published private(set) var state = State.idle
    
    let preferencesType: CityPreferencesType
    
    init(preferencesType: CityPreferencesType) {
        self.preferencesType = preferencesType
        subscribe()
    }
     
    deinit {
        bag.removeAll()
    }
    
    private func subscribe() {
        preferencesType.savedCity
            .sink { [weak self] value in
                self?.setupState(for: value)
            }
            .store(in: &bag)
    }
    
    private func setupState(for cityName: String?) {
        let cities = CityLoader().loadCities()
        if let name = cityName,
            let selectedCity = cities.filter({ $0.name == name }).first {
            let weatherViewModel = WeatherViewModel(city: selectedCity, repository: WeatherRepository())
            state = .weather(viewModel: weatherViewModel)
        } else {
            let citiesViewModel = CitiesViewModel(cities: cities, preferencesType: preferencesType)
            state = .chooseCity(viewModel: citiesViewModel)
        }
    }
}

extension ContentViewModel {
    
    enum State {
        case idle
        case weather(viewModel: WeatherViewModel)
        case chooseCity(viewModel: CitiesViewModel)
    }
}
