//
//  WeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var selectedItem = 0
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            if let currentVM = viewModel.currentWeatherViewModel,
               let hourlyVM = viewModel.hourlyWeatherViewModel {
                VStack {
                    CurrentWeatherView(viewModel: currentVM)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            titleView()
                            cityIcon()
                        }
                    tabbar(hourlyVM: hourlyVM)
                }
            } else {
                spinner.eraseToAnyView()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private var spinner: Spinner { Spinner(isAnimating: true, style: .large) }
    
    private func tabbar(hourlyVM: HourlyViewModel) -> some View {
        TabView(selection: $selectedItem) {
            HourlyView(viewModel: hourlyVM)
                .tabItem {
                    Label("Hourly", systemImage: "clock")
                }
                .tag(0)
            
            dailySection()
                .onAppear(perform: {
                    viewModel.fetchDailyWeather()
                })
                .tabItem {
                    Label("Daily", systemImage: "calendar")
                }
                .tag(1)
        }
    }
    
    private func dailySection() -> some View {
        if let dailyVM = viewModel.dailyWeatherViewModel {
            return DailyView(viewModel: dailyVM).eraseToAnyView()
        } else {
            return spinner.eraseToAnyView()
        }
    }
    
    private func cityIcon() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink {
                CitiesView(viewModel: CitiesViewModel(cities: CityLoader().loadCities(), city: $viewModel.city, preferencesType: CityPreferences()))
            } label: {
                Image(systemName: "magnifyingglass").imageScale(.large)
            }
            .tint(Color.black)
        }
    }
    
    private func titleView() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            VStack {
                Text("Pogoda").font(.headline)
                Text(viewModel.cityName.output).font(.subheadline)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(city: City.load, repository: WeatherRepository()))
    }
}
