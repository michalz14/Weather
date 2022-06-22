//
//  RemoteImage.swift
//  Weather
//
//  Created by Michał Zieliński on 22/06/2022.
//

import SwiftUI
import Combine

struct RemoteImage: View {
    @ObservedObject var imageModel: ImageViewModel
    init(url: URL?, placeholder: UIImage = UIImage()) {
        imageModel = ImageViewModel(url: url, placeholder: placeholder)
    }
    var body: some View {
        imageModel
            .image
            .map { Image(uiImage: $0).resizable() }
            .onAppear(perform: imageModel.load)
            .onDisappear(perform: imageModel.cancel)
    }
}
