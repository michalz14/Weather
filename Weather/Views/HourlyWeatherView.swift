//
//  HourlyWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    let viewModel: HourlyWeatherViewModel
    
    var body: some View {
        CardView {
            VStack(spacing: 12) {
                Text(viewModel.time)
                    .font(.body)
                Image(systemName: "cloud.moon")
                Text(viewModel.temperature)
                    .font(.title)
                Text(viewModel.cloud)
                    .font(.body)
            }
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: HourlyWeatherViewModel(weather: DailyWeatherView_Previews.weather))
    }
}
