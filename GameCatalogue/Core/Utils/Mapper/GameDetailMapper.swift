//
//  GameDetailMapper.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation

final class GameDetailMapper {
    static func mapDetailGameResponseToEntity(
        input gameDetail: GameDetailResponse
    ) -> GameEntity {
        let gameEntity = GameEntity()
<<<<<<< HEAD
        var date: Date? = Date()
        date = gameDetail.released?.toDate()
        let new_date = date?.toString()
=======
>>>>>>> 91a4024c0c8c2652a6ce6aed8ed61066d08a4001
        gameEntity.id = gameDetail.id ?? 0
        gameEntity.name = gameDetail.name ?? ""
        gameEntity.image = gameDetail.image ?? ""
        gameEntity.playtime = gameDetail.playtime ?? 0
        gameEntity.gameDescription = gameDetail.gameDescription ?? ""
        gameEntity.rating = gameDetail.rating ?? 0
        gameEntity.released = new_date ?? ""
        
        return gameEntity
    }
    
    static func mapDetailEntityToDomain(
        input gameDetail: GameEntity
    ) -> GameModel {
        return GameModel(
            id: gameDetail.id,
            name: gameDetail.name,
            released: gameDetail.released,
            rating: gameDetail.rating,
            image: gameDetail.image,
            playtime: gameDetail.playtime,
            gameDescription: gameDetail.gameDescription,
            favorite: gameDetail.favorite
        )
    }
    static func mapFavoriteEntityToDomain(
        input gameDetail: [GameEntity]
    ) -> [GameModel] {
        return gameDetail.map{ result in
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
