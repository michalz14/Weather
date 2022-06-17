//
//  HourlyWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct HourlyWeatherViewModel {
    
    let time: String
    let icon: String
    let temperature: String
    let cloud: String
    
    init(weather: Weather) {
        time = weather.datestamp.date.stringFormat(.time)
        icon = weather.descriptor?.first?.icon ?? ""
        temperature = Formatters.Temperature.celsius(Int(weather.currentTemperature ?? 0.0))
        cloud = "\(weather.clouds)"
    }
}
