//
//  ContentView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: ContentViewModel
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            return Color.white.eraseToAnyView()
        case .weather(let weatherVM):
            return WeatherView(viewModel: weatherVM).eraseToAnyView()
        case .chooseCity(let citiesVM):
            return CitiesView(viewModel: citiesVM).eraseToAnyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(preferencesType: CityPreferences()))
    }
}
