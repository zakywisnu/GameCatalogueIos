//
//  GameDetailResponse.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation

struct GameDetailResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case gameDescription = "description"
        case released = "released"
        case image = "background_image"
        case rating = "rating"
        case playtime = "playtime"
//        case tags = "tags"
    }
    let id: Int?
    let name: String?
    let gameDescription: String?
    let released: String?
    let image: String?
    let rating: Double?
    let playtime: Int?
//    let tags: [TagsResponse]
}
