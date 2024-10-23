//
//  Photo.swift
//  pagination
//
//  Created by Sachin Sharma on 15/05/24.
//

import Foundation

struct Photo: Identifiable, Codable, Hashable {
    var id: String
    var author: String
    var url: String
    private var downloadUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case url
        case downloadUrlString = "download_url"
    }
    
    var downloadUrl: URL? {
        return URL(string: downloadUrlString)
    }
    
    var imageUrl: URL? {
        return URL(string: "https://picsum.photos/id/\(id)/256/256.jpg")
    }
}
