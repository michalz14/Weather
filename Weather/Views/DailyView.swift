//
//  DailyView.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import SwiftUI

struct DailyView: View {

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
        HStack(spacing: 20) {
            Text("Data")
                .font(.system(size: 12))
            Spacer()
            Text("Temperatura °C")
                .font(.system(size: 12))
            Text("Opady")
                .font(.system(size: 12))
            Text("Wiatr")
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(viewModel: DailyViewModel(items: City.load.dailyWeather ?? []))
    }
}
