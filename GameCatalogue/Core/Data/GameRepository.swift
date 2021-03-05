//
//  GameRepository.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift

protocol GameRepositoryProtocol {
    func getListGame() -> Observable<[GameModel]>
    func getDetailGame(by id: Int) -> Observable<GameDetailModel>
    func updateFavoriteGame(by id: Int) -> Observable<GameDetailModel>
    func getFavoriteGame() -> Observable<[GameDetailModel]>
}

final class GameRepository: NSObject {
    typealias GameInstance = (LocalDataSource, RemoteDataSource) -> GameRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(local: LocalDataSource, remote: RemoteDataSource){
        self.local = local
        self.remote = remote
    }
    
    static let sharedInstance: GameInstance = {localRepo, remoteRepo in
        return GameRepository(local: localRepo, remote: remoteRepo)
    }
}

extension GameRepository: GameRepositoryProtocol{
    func getListGame() -> Observable<[GameModel]> {
        return self.local.getListGame()
            .map{ GameMapper.mapListGameEntityToDomain(input: $0)}
            .filter{!$0.isEmpty}
            .ifEmpty(switchTo: self.remote.getListGame()
                        .map{GameMapper.mapListGameResponseToEntity(input: $0)}
                        .flatMap{ self.local.addListGame(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getListGame()
                            .map{ GameMapper.mapListGameEntityToDomain(input: $0)}
                        }
            )
        
    }
    
        func getDetailGame(by id: Int) -> Observable<GameDetailModel> {
            return self.local.getDetailGame(id: id)
                .map{ GameDetailMapper.mapDetailEntityToDomain(input: $0)}
                .filter{!$0.name.isEmpty}
                .ifEmpty(switchTo: self.remote.getDetailGame(id: id)
                            .map{ GameDetailMapper.mapDetailGameResponseToEntity(input: $0)}
                            .flatMap{self.local.addDetailGame(from: $0)}
                            .filter{$0}
                            .flatMap{ _ in self.local.getDetailGame(id: id)
                                .map{ GameDetailMapper.mapDetailEntityToDomain(input: $0)}
                            }
                )

        }

    
    func updateFavoriteGame(by id: Int) -> Observable<GameDetailModel> {
        return self.local.updateFavoriteGame(by: id)
            .map{ GameDetailMapper.mapDetailEntityToDomain(input: $0)}
    }
    
    func getFavoriteGame() -> Observable<[GameDetailModel]> {
        return self.local.getFavoriteGame()
            .map{ GameDetailMapper.mapFavoriteEntityToDomain(input: $0)}
    }
    
    
}
