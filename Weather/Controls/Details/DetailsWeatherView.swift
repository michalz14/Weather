//
//  DetailsWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct DetailsWeatherView: View {
    
    private struct Constants {
        static let spacing: CGFloat = 2.0
        static let elementPadding: CGFloat = 16.0
    }
    
    let viewModel: DetailsWeatherViewModel
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            HStack(spacing: Constants.spacing) {
                weatherElement(viewModel.wind)
                weatherElement(viewModel.clouds)
            }
            HStack(spacing: Constants.spacing) {
                weatherElement(viewModel.humidity)
                weatherElement(viewModel.pressure)
            }
        }
        .padding(Constants.spacing)
        .background(Color.gray.opacity(0.2))
    }
    
    private func weatherElement(_ viewModel: DetailsWeatherViewModel.DetailsElementViewModel) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.title)
                Text(viewModel.name)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Image(systemName: viewModel.icon)
                Text(viewModel.value)
            }
        }
        .padding(Constants.elementPadding)
        .background(Color.white.opacity(0.5))
    }
}

struct DetailsWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsWeatherView(viewModel: DetailsWeatherViewModel(weather: DailyWeatherView_Previews.weather))
    }
}
