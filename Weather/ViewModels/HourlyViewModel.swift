//
//  HourlyViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct HourlyViewModel {
    
    var items = [HourlyItemWeatherViewModel]()
    
    init(items: [Weather]) {
        self.items = items.map({ HourlyItemWeatherViewModel(weather: $0) })
    }
    
}
