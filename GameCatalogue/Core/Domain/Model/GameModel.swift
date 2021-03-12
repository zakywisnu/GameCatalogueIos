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
    let rating: Double
    let image: String
    let playtime: Int
    let gameDescription: String
    let favorite: Bool
}
