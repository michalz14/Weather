//
//  WeatherApp.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(preferencesType: CityPreferences()))
        }
    }
}
