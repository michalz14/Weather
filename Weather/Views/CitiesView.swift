//
//  CitiesView.swift
//  Weather
//
//  Created by Michał Zieliński on 20/06/2022.
//

import SwiftUI

struct CitiesView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CitiesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cityViewModels) { item in
                Button {
                    viewModel.saveCity(item.city)
                    self.dismiss()
                } label: {
                    cityView(for: item)
                }
                .tint(Color.black)
            }
        }
        .navigationTitle("Wybierz miasto")
    }
    
    private func cityView(for item: CitiesViewModel.CityViewModel) -> some View {
        HStack {
            Text(item.name)
            Spacer()
            if item.isSelected {
                Image(systemName: "checkmark")
            }
        }
        .padding()
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView(viewModel: CitiesViewModel(cities: CityLoader().loadCities(), preferencesType: CityPreferences()))
    }
}
