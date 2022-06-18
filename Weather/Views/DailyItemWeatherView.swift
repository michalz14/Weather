//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct DailyItemWeatherView: View {
    
    let viewModel: DailyItemWeatherViewModel
    
    var body: some View {
        CardView {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.date)
                        Text(viewModel.weekday)
                    }
                    Spacer()
                    Spacer()
                    Image(systemName: "cloud.moon")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(viewModel.maxTemperature)
                        Text(viewModel.minTemperature)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Text(viewModel.cloud)
                    Spacer()
                    VStack(alignment: .center) {
                        Text(viewModel.wind)
                        Image(systemName: "arrow.up.right")
                    }
                }
            }
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    
    static var weather: Weather {
        var weather = Weather()
        weather.datestamp = 1_655_449_365
        weather.wind = 4
        weather.clouds = 100
        weather.currentTemperature = 20
        weather.temperature = Temperature()
        weather.temperature?.max = 24
        weather.temperature?.min = 13
        return weather
    }
    
    static var previews: some View {
        DailyItemWeatherView(viewModel: DailyItemWeatherViewModel(weather: weather))
            .padding()
    }
}
