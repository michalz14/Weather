//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct DailyItemWeatherView: View {
    
    private struct Constants {
        static let itemWidth: CGFloat = 42.0
    }
    let viewModel: DailyItemWeatherViewModel
    
    var body: some View {
        CardView {
            ZStack {
                HStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text(viewModel.date)
                            .font(.caption)
                        Text(viewModel.weekday)
                    }
                    Spacer()
                    RemoteImage(url: viewModel.icon)
                        .frame(width: 26, height: 26)
                    VStack(alignment: .trailing) {
                        Text(viewModel.maxTemperature)
                        Text(viewModel.minTemperature)
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: Constants.itemWidth)
                    Text(viewModel.cloud)
                        .frame(width: Constants.itemWidth)
                    VStack(alignment: .center) {
                        Text(viewModel.wind)
                        Image(systemName: "arrow.up.right")
                    }
                    .frame(width: Constants.itemWidth)
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
