//
//  ContentView.swift
//  Weather
//
//  Created by Michał Zieliński on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color.red
                .frame(height: 300)
            TabView {
                Text("One")
                    .tabItem {
                        Text("Test 1")
                    }
                Text("Two")
                    .tabItem {
                        Text("Test 1")
                    }
            }
            .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
