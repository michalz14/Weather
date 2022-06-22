//
//  DetailsWeatherViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct DetailsWeatherViewModel {
    
    struct DetailsElementViewModel {
        let title: String
        let icon: String
        let name: String
        let value: String
    }
    
    let wind: DetailsElementViewModel
    let clouds: DetailsElementViewModel
    let humidity: DetailsElementViewModel
    let pressure: DetailsElementViewModel
    
    init(weather: Weather) {
        wind = DetailsElementViewModel(title: "Wiatr",
                                       icon: "wind",
                                       name: "Prędkość",
                                       value: "\(weather.wind)")
        
        clouds = DetailsElementViewModel(title: "Opady",
                                         icon: "cloud",
                                         name: "Suma",
                                         value: "\(weather.clouds)")
        
        humidity = DetailsElementViewModel(title: "Wilgotność",
                                           icon: "humidity",
                                           name: "Suma",
                                           value: "\(weather.humidity)")
        
        pressure = DetailsElementViewModel(title: "Ciśnienie",
                                           icon: "aqi.low",
                                           name: "Suma",
                                           value: "\(weather.pressure)")
    }
}
