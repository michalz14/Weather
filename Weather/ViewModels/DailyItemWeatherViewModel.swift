//
//  DailyWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct DailyItemWeatherViewModel: Identifiable {
    let id = UUID()
    let date: String
    let weekday: String
    let icon: String
    let maxTemperature: String
    let minTemperature: String
    let cloud: String
    let wind: String
    
    init(weather: Weather) {
        date = weather.datestamp.date.stringFormat(.fullDate)
        weekday = weather.datestamp.date.stringFormat(.weekday)
        icon = weather.descriptor?.first?.icon ?? ""
        maxTemperature = "\(Int(weather.temperature?.max ?? 0.0))"
        minTemperature = "\(Int(weather.temperature?.min ?? 0.0))"
        cloud = "\(weather.clouds)"
        wind = "\(weather.wind)"
    }
}
