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
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            HStack(spacing: Constants.spacing) {
                weatherElement()
                weatherElement()
            }
            HStack(spacing: Constants.spacing) {
                weatherElement()
                weatherElement()
            }
        }
        .padding(Constants.spacing)
        .background(Color.gray.opacity(0.2))
    }
    
    private func weatherElement() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Title")
                Text("name")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Image(systemName: "cloud.moon")
                Text("value")
            }
        }
        .padding(Constants.elementPadding)
        .background(Color.white.opacity(0.5))
    }
}

struct DetailsWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsWeatherView()
    }
}
