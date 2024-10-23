//
//  TabBarView.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 19/06/24.
//

import SwiftUI
import UIKit

struct TabBarView: View {
    var body: some View {
        TabView {
            test()
                .tabItem { Label("Home", systemImage: "house") }
            
            continuity()
                .tabItem { Label("continuity", systemImage: "map") }
            FirstViewControllerWrapper()
                .tabItem { Label("Profile", systemImage: "person") }
            
        }.background(.black.opacity(0.5))
    }
}

#Preview {
    TabBarView()
}

struct FirstViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ProfileVC {
        return ProfileVC()
    }

    func updateUIViewController(_ uiViewController: ProfileVC, context: Context) {
        // Update the view controller if needed
    }
}
