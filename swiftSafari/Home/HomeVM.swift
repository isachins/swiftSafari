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
            HomeModel(name: "Pagination And JSON Parsing", image: "book.pages", destinationView: "PaginationHome"),
            HomeModel(name: "Expandable Search Bar", image: "rectangle.and.text.magnifyingglass", destinationView: "ExpandableSearchHomeView"),
        ]
    }
    
    func getView(for viewName: String) -> AnyView {
        switch viewName {
        case "PaginationHome":
            return AnyView(PaginationHome())
        case "ExpandableSearchHomeView":
            return AnyView(ExpandableSearchHomeView())
        // Add cases for other views as needed
        default:
            return AnyView(EmptyView()) // Default empty view if view name not found
        }
    }
}
