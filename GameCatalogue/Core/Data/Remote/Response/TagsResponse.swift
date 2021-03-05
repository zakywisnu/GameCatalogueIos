//
//  TagsResponse.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 03/03/21.
//

import Foundation

struct ListTagsResponse: Codable {
    let tags: [TagsResponse]
}

struct TagsResponse: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image_background"
    }
    
    let id: Int?
    let name: String?
    let image: String?
}
