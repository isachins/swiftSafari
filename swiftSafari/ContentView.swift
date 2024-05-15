//
//  ContentView.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
