//
//  HourlyView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct HourlyView: View {
    
    let viewModel: HourlyViewModel
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.items) { item in
                    HourlyItemWeatherView(viewModel: item)
                }
            }
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView(viewModel: HourlyViewModel(items: City.load.hourlyWeather ?? []))
    }
}
