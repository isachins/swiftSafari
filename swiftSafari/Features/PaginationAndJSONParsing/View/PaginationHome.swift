//
//  PaginationHome.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 16/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PaginationHome: View {
    @State private var photos: [Photo] = []
    @State private var page: Int = 1
    @State private var lastFetchedPage: Int = 1
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3)){
                    ForEach(photos) { photo in
                        PhotoCardView(photo: photo)
                    }
                }
                .padding(15)
            }
        }
    }
}

struct PhotoCardView: View {
    var photo: Photo
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            GeometryReader {
                let size = $0.size
                
                AnimatedImage(url: photo.imageUrl) {
                    ProgressView()
                        .frame(width: size.width, height: size.height)
                }
                
            }
        }
    }
}

#Preview {
    PaginationHome()
}
