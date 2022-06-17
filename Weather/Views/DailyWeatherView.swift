//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct DailyWeatherView: View {
    var body: some View {
        CardView {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Data")
                        Text("Dzień")
                    }
                    Spacer()
                    Spacer()
                    Image(systemName: "cloud.moon")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("23")
                        Text("16")
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Text("-")
                    Spacer()
                    VStack(alignment: .center) {
                        Text("4")
                        Image(systemName: "arrow.up.right")
                    }
                }
            }
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
            .padding()
    }
}
