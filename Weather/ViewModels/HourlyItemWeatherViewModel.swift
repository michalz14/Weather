//
//  HourlyWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct HourlyItemWeatherViewModel: Identifiable {
    
    let id = UUID()
    let time: String
    let icon: URL?
    let temperature: String
    let cloud: String
    
    init(weather: Weather) {
        time = weather.datestamp.date.stringFormat(.time)
        icon = ImageViewModel.iamgeURL(for: weather.descriptor?.first?.icon ?? "")
        temperature = Formatters.Temperature.celsius(Int(weather.currentTemperature ?? 0.0))
        cloud = "\(weather.clouds)"
    }
}
