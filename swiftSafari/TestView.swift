//
//  TestView.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 17/05/24.
//

import SwiftUI

struct TestView: View {
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack {
                   VStack {
                       Text("Home View")
                       NavigationLink(destination: DetailView(textString: "Hellooooo")) {
                           Text("Go to Detail View")
                       }
                   }
                   .navigationTitle("Home")
               }
    }
}

#Preview {
    TestView()
}

struct DetailView: View {
    @State var textString = "Hello"
    var body: some View {
        VStack {
            Text("\(textString)")
        }
        .navigationTitle("Detail")
    }
}
