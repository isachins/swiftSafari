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
    @State private var isLoading: Bool = false
    @State private var maxPage:Int = 5
    
    //MARK: Pagination  Property
    @State private var activePhotoID: String?
    @State private var lastPhotoID: String?
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3)){
                    ForEach(photos) { photo in
                        PhotoCardView(photo: photo)
                    }
                }
                .overlay(alignment: .bottom, content: {
                    if isLoading {
                        ProgressView()
                            .offset(y: 30)
                    }
                })
                .padding(15)
                .padding(.bottom, 15)
                .scrollTargetLayout()
            }
            .scrollPosition(id: $activePhotoID, anchor: .bottomTrailing)
            .onChange(of: activePhotoID, { oldValue, newValue in
                if newValue == lastPhotoID, !isLoading, page != maxPage {
                    page += 1
                }
            })
            .onAppear() {
                if photos.isEmpty { fetchPhotos() }
            }
        }.navigationTitle("JSON Parsing")
    }
    
    //Fetching photos as per need
    func fetchPhotos() {
        Task {
            do {
                if let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=30") {
                    isLoading = true
                    let session = URLSession(configuration: .default)
                    let jsonData = try await session.data(from: url).0
                    let photos = try await JSONDecoder().decode([Photo].self, from: jsonData)
                    
                    //Updating UI in main Thread
                    await MainActor.run {
                        if photos.isEmpty {
                            //No more data
                            page = lastFetchedPage
                        } else {
                            //Adding to the Array of Photos
                            self.photos.append(contentsOf: photos)
                            lastPhotoID = self.photos.last?.id
                            lastFetchedPage = page
                        }
                        isLoading = false
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
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
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 10))
                
            }
            .frame(height: 120)
            
            //Author Name
            Text(photo.author)
                .font(.caption)
                .foregroundStyle(.gray)
                .lineLimit(1)
        }
    }
}

#Preview {
    PaginationHome()
}
