//
//  WeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            if let currentVM = viewModel.currentWeatherViewModel,
               let hourlyVM = viewModel.hourlyWeatherViewModel,
               let dailyVM = viewModel.dailyWeatherViewModel {
                VStack {
                    CurrentWeatherView(viewModel: currentVM)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            titleView()
                            cityIcon()
                        }
                    tabbar(hourlyVM: hourlyVM, dailyVM: dailyVM)
                }
            } else {
                EmptyView()
            }
        }
        .navigationViewStyle(.stack)
//        .onAppear {
//            viewModel.fetchHourlyWeather()
//            viewModel.fetchDailyWeather()
//        }
    }
    
    private func tabbar(hourlyVM: HourlyViewModel, dailyVM: DailyViewModel) -> some View {
        TabView {
            HourlyView(viewModel: hourlyVM)
                .tabItem {
                    Label("Hourly", systemImage: "clock")
                }
            
            DailyView(viewModel: dailyVM)
                .tabItem {
                    Label("Daily", systemImage: "calendar")
                }
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
