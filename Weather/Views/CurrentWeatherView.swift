//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    let viewModel: CurrentWeatherViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "cloud.moon")
                    .resizable()
                    .frame(width: 102, height: 102)
                Spacer()
                HStack(alignment: .lastTextBaseline) {
                    Text(viewModel.temperature)
                        .font(.system(size: 102))
                    Text("°C")
                }
            }
            .padding()
            DetailsWeatherView(viewModel: viewModel.detailsViewModel)
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(viewModel:
                            CurrentWeatherViewModel(weather: DailyWeatherView_Previews.weather)
        )
    }
}
