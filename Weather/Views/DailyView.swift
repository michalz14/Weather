//
//  DailyView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct DailyView: View {

    private struct Constants {
        static let itemWidth: CGFloat = 42.0
        static let fontSize: CGFloat = 12.0
        static let spacing: CGFloat = 16.0
    }
    
    let viewModel: DailyViewModel

    var body: some View {
        List {
            header()
                .listRowSeparator(.hidden)
            ForEach(viewModel.items) { item in
                DailyItemWeatherView(viewModel: item)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
    
    private func header() -> some View {
        HStack(spacing: Constants.spacing) {
            Text("Data")
                .font(.system(size: Constants.fontSize))
            Spacer()
            Text("Temperatura °C")
                .font(.system(size: Constants.fontSize))
            Text("Opady")
                .font(.system(size: Constants.fontSize))
                .frame(width: Constants.itemWidth)
            Text("Wiatr")
                .font(.system(size: Constants.fontSize))
                .frame(width: Constants.itemWidth)
        }
        .padding(.horizontal)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(viewModel: DailyViewModel(items: City.load.dailyWeather ?? []))
    }
}
