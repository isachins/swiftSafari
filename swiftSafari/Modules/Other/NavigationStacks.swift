//
//  NavigationStacks.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 08/06/24.
//

import SwiftUI

struct NavigationStacks: View {
    
    var platforms: [Platform] = [
        .init(name: "Xbox", imageName: "xbox.logo", color: .green),
        .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .mint)
    ]
    
    var games: [Game] = [
        .init(name: "Minecraft", rating: "99"),
        .init(name: "GTAV", rating: "100")
    ]
    
    
    
    var body: some View {
        ZStack {
            Text("HLO")
        }
//        NavigationStack {
//            List {
//                Section("Platforms") {
//                    ForEach(platforms, id: \.name) { platform in
//                        NavigationLink(value: platform) {
//                            Label(platform.name, systemImage: platform.imageName)
//                            .foregroundStyle(platform.color)
//                        }
//                    }
//                }
//                Section("Games") {
//                    ForEach(games, id: \.name) { game in
//                        NavigationLink(value: game) {
//                            Text(game.name)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Gaming")
//            .navigationDestination(for: Platform.self) { platform in
//                ZStack {
//                    platform.color.ignoresSafeArea()
//                    VStack {
//                        Text(platform.name)
//                            .font(.largeTitle)
//                        
//                        List {
//                            ForEach(games, id: \.name) { game in
//                                NavigationLink(value: game) {
//                                    Text(game.name)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationDestination(for: Game.self) { game in
//                ZStack {
//                    Text("\(game.name) -> \(game.rating)")
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStacks()
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}
