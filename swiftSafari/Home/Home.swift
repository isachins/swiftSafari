//
//  Home.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 16/05/24.
//

import SwiftUI

struct Home: View {
    @ObservedObject var objHomeVM = HomeVM()
    var body: some View {
        List(objHomeVM.viewData) { view in
            NavigationLink(destination: objHomeVM.getView(for: view.destinationView)) {
                HStack {
                    Image(systemName: view.image)
                    Text(view.name)
                }
            }
        }
    }
    

}

struct View1: View {
    var body: some View {
        Text("This is View 1")
    }
}

#Preview {
    ContentView()
}
