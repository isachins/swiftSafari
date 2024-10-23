//
//  continuity.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 11/06/24.
//

import SwiftUI


struct continuity: View {
    
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
        NavigationStack {
            VStack {
                List(platforms, id: \.name) { platform in
                    NavigationLink(value: platform) {
                        GeometryReader { _ in
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                .listStyle(.automatic)
                .navigationTitle("Gaming")
                .navigationDestination(for: Platform.self) { platform in
                    PlatformDetailView(platform: platform, games: games)
                }
                .navigationDestination(for: Game.self) { game in
                    GameDetailView(game: game)
                }
            }
        }
    }
}

struct PlatformDetailView: View {
    let platform: Platform
    let games: [Game]
    
    var body: some View {
        ZStack {
            platform.color.ignoresSafeArea()
            VStack {
                Text(platform.name)
                    .font(.largeTitle)
                
                List {
                    Section("Games") {
                        ForEach(games, id: \.name) { game in
                            NavigationLink(value: game) {
                                Text(game.name)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GameDetailView: View {
    let game: Game
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text("\(game.name) -> \(game.rating)")
                .font(.largeTitle)
        }
    }
}


struct card: View {
    let name: String
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.rect(cornerRadius: 15))
                .padding()
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
                
        }
        
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .clipShape(.rect(cornerRadius: 15))
        .background(.mint)
        .padding(10)
        .clipShape(.rect(cornerRadius: 15))
        
    }
}

#Preview {
    continuity()
}
