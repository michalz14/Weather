//
//  CitiesViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 20/06/2022.
//

import Foundation
import SwiftUI

class CitiesViewModel: ObservableObject {
    
    var cities: [City]
    @Binding var selectedCity: City
    
    var cityViewModels = [CityViewModel]()
    
    init(cities: [City], city: Binding<City>) {
        self.cities = cities
        self._selectedCity = city
        
        cityViewModels = cities.map({ CityViewModel(city: $0,
                                                    isSelected: $0 == selectedCity) })
    }
    
}

extension CitiesViewModel {
    
    struct CityViewModel: Identifiable {
        
        let id = UUID()
        var name: String { city.name ?? "" }
        let isSelected: Bool
        let city: City
        
        init(city: City, isSelected: Bool) {
            self.city = city
            self.isSelected = isSelected
        }
    }
}
