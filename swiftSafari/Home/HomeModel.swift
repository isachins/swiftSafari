//
//  HomeModel.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 16/05/24.
//

import Foundation

struct HomeModel: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var destinationView: String
}

let viewData: [HomeModel] = [
    HomeModel(name: "View1", image: "book.pages", destinationView: "ContentView")
]
