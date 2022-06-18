//
//  ContentView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CurrentWeatherView(viewModel: CurrentWeatherViewModel(weather: DailyWeatherView_Previews.weather))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Title").font(.headline)
                            Text("Subtitle").font(.subheadline)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                                
                            }) {
                                Image(systemName: "magnifyingglass").imageScale(.large)
                            }
                            .tint(Color.black)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
