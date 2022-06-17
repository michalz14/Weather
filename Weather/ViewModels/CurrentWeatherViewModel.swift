//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct CurrentWeatherViewModel {
    
    let icon: String
    let temperature: String
    
    let detailsViewModel: DetailsWeatherViewModel
    
    
    init(weather: Weather) {
        icon = weather.descriptor?.first?.icon ?? ""
        temperature = "\(Int(weather.currentTemperature ?? 0.0))"
        detailsViewModel = DetailsWeatherViewModel(weather: weather)
    }
}
