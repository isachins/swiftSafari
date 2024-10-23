//
//  CustomTabBar.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 20/08/24.
//

import SwiftUI

//struct CustomTabBar: View {
//    @State private var selectedIndex: Int = 0
//
//    var body: some View {
//        TabView(selection: $selectedIndex) {
//            NavigationStack() {
//                ContentView()
//                    //.navigationTitle("Home")
//            }
//            .tabItem {
//                Text("Home view")
//                Image(systemName: "house.fill")
//                    .renderingMode(.template)
//            }
//            .tag(0)
//            
//            NavigationStack() {
//                Text("Profile view")
//                    .navigationTitle("Profile")
//            }
//            .tabItem {
//                Label("Profile", systemImage: "person.fill")
//            }
//            .tag(1)
//            
//            NavigationStack() {
//                Text("About view")
//                    .navigationTitle("About")
//                
//            }
//            .tabItem {
//                Text("About view")
//                Image(systemName: "info.circle")
//            }
//            .badge("12")
//            .tag(2)
//            NavigationStack() {
//                Text("Profile view")
//                    .navigationTitle("Profile")
//            }
//            .tabItem {
//                Label("Profile", systemImage: "person.fill")
//            }
//            .tag(3)
//            NavigationStack() {
//                Text("Profile view")
//                    .navigationTitle("Profile")
//            }
//            .tabItem {
//                Label("Profile", systemImage: "person.fill")
//            }
//            .tag(4)
//        }
//        //1
//        .tint(.blue)
//        .onAppear(perform: {
//            //2
//            UITabBar.appearance().unselectedItemTintColor = .systemGray
//            //3
//            UITabBarItem.appearance().badgeColor = .green
//            //4
//            UITabBar.appearance().backgroundColor = .white // .systemGray4.withAlphaComponent(0.4)
//            //5
//            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
//            //UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
//            //Above API will kind of override other behaviour and bring the default UI for TabView
//        })
//    }
//}
//
//#Preview {
//    CustomTabBar()
//}
