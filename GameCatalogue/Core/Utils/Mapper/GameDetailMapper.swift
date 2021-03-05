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
    ) -> GameDetailEntity {
        let gameEntity = GameDetailEntity()
        gameEntity.id = gameDetail.id ?? 0
        gameEntity.name = gameDetail.name ?? ""
        gameEntity.image = gameDetail.image ?? ""
        gameEntity.playtime = gameDetail.playtime ?? 0
        gameEntity.gameDescription = gameDetail.gameDescription ?? ""
        gameEntity.rating = gameDetail.rating ?? 0
        gameEntity.released = gameDetail.released ?? ""
        
        return gameEntity
    }
    
    static func mapDetailEntityToDomain(
        input gameDetail: GameDetailEntity
    ) -> GameDetailModel {
        return GameDetailModel(
            id: gameDetail.id,
            name: gameDetail.name,
            description: gameDetail.gameDescription,
            released: gameDetail.released,
            image: gameDetail.image,
            rating: gameDetail.rating,
            playtime: gameDetail.playtime,
            favorite: gameDetail.favorite
        )
    }
    
    static func mapFavoriteEntityToDomain(
        input gameDetail: [GameDetailEntity]
    ) -> [GameDetailModel] {
        return gameDetail.map{ result in
            return GameDetailModel(
                id: result.id,
                name: result.name,
                description: result.gameDescription,
                released: result.released,
                image: result.image,
                rating: result.rating,
                playtime: result.playtime,
                favorite: result.favorite
            )
        }
    }
}
