//
//  WeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationView {
            VStack {
                CurrentWeatherView(viewModel: CurrentWeatherViewModel(weather: City.load.current!))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        titleView()
                        cityIcon()
                    }
                tabbar()
            }
        }
    }
    
    private func tabbar() -> some View {
        TabView {
            HourlyView(viewModel: HourlyViewModel(items: City.load.hourlyWeather ?? []))
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            DailyView(viewModel: DailyViewModel(items: City.load.dailyWeather ?? []))
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
    
    private func cityIcon() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                
            }) {
                Image(systemName: "magnifyingglass").imageScale(.large)
            }
            .tint(Color.black)
        }
    }
    
    private func titleView() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            VStack {
                Text("Title").font(.headline)
                Text("Subtitle").font(.subheadline)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
