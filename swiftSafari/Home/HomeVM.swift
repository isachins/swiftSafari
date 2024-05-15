//
//  HomeVM.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 16/05/24.
//

import Foundation
import SwiftUI

class HomeVM: ObservableObject {
    @Published var viewData: [HomeModel]
    
    init() {
        self.viewData = [
            HomeModel(name: "View1", image: "book.pages", destinationView: "View1"),
        ]
    }
    
    func getView(for viewName: String) -> AnyView {
        switch viewName {
        case "View1":
            return AnyView(View1())
        // Add cases for other views as needed
        default:
            return AnyView(EmptyView()) // Default empty view if view name not found
        }
    }
}
