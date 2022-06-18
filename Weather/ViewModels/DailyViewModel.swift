//
//  DailyViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct DailyViewModel {
    
    var items = [DailyItemWeatherViewModel]()
    
    init(items: [Weather]) {
        self.items = items.map({ DailyItemWeatherViewModel(weather: $0) })
    }
    
}
