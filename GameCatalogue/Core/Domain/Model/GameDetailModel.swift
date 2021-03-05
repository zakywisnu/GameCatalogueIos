//
//  GameDetailModel.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
struct GameDetailModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let released: String
    let image: String
    let rating: Double
    let playtime: Int
    let favorite: Bool
}
