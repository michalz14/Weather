//
//  CardView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        content()
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("CardView")
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
