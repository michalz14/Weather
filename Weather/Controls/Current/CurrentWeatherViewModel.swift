//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct CurrentWeatherViewModel: Identifiable {
    
    let id = UUID()
    let icon: URL?
    let temperature: String
    
    let detailsViewModel: DetailsWeatherViewModel
    
    
    init(weather: Weather) {
        icon = ImageViewModel.iamgeURL(for: weather.descriptor?.first?.icon ?? "")
        temperature = "\(Int(weather.currentTemperature ?? 0.0))"
        detailsViewModel = DetailsWeatherViewModel(weather: weather)
    }
}
