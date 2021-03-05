//
//  GameResponse.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
struct ListGameResponse: Codable {
    let results: [GameResponse]
}

struct GameResponse: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case released = "released"
        case rating = "rating"
        case image = "background_image"
        case playtime = "playtime"
    }
    
    let id: Int?
    let name: String?
    let released: String?
    let rating: Float?
    let image: String?
    let playtime: Int?
}
