//
//  ContentView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            return spinner.eraseToAnyView()
        case .weather(let weatherVM):
            return WeatherView(viewModel: weatherVM).eraseToAnyView()
        case .chooseCity(let citiesVM):
            return CitiesView(viewModel: citiesVM).eraseToAnyView()
        }
    }
    
    private var spinner: Spinner { Spinner(isAnimating: true, style: .large) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(preferencesType: CityPreferences()))
    }
}
