//
//  GameMapper.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation

final class GameMapper {
    static func mapListGameResponseToEntity(
        input listGame: [GameResponse]
    ) -> [GameEntity] {
        return listGame.map { result in
            let gameEntity = GameEntity()
            gameEntity.id = result.id ?? 0
            gameEntity.name = result.name ?? ""
            gameEntity.image = result.image ?? ""
            gameEntity.playtime = result.playtime ?? 0
            gameEntity.rating = result.rating ?? 0
            gameEntity.released = result.released ?? ""
            
            return gameEntity
        }
    }
    
    static func mapListGameEntityToDomain(
        input listGame: [GameEntity]
    ) -> [GameModel] {
        return listGame.map{ result in
            return GameModel(
                id: result.id,
                name: result.name,
                released: result.released,
                rating: result.rating,
                image: result.image,
                playtime: result.playtime,
                gameDescription: result.gameDescription,
                favorite: result.favorite
            )
        }
    }
}
