//
//  HourlyWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    var body: some View {
        CardView {
            VStack(spacing: 12) {
                Text("Test")
                    .font(.body)
                Image(systemName: "cloud.moon")
                Text("23")
                    .font(.title)
                Text("Test")
                    .font(.body)
            }
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView()
    }
}
