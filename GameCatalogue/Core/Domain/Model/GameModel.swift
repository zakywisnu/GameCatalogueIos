//
//  GameModel.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
struct GameModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let rating: Float
    let image: String
    let playtime: Int
}
