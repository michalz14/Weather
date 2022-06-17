//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "cloud.moon")
                    .resizable()
                    .frame(width: 102, height: 102)
                Spacer()
                Text("23")
                    .font(.system(size: 122))
            }
            .padding()
            DetailsWeatherView()
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
//            .padding()
        
    }
}
