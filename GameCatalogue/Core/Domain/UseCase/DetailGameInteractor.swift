//
//  DetailGameInteractor.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift

protocol GameDetailUseCase {
    func getMovieDetail() -> Observable<GameModel>
    func updateFavoriteGame() -> Observable<GameModel>
}

class GameDetailInteractor: GameDetailUseCase {
    
    private let repository: GameRepositoryProtocol
    private let id: Int
    
    required init(by id: Int, repository: GameRepositoryProtocol) {
        self.id = id
        self.repository = repository
    }
    
    func getMovieDetail() -> Observable<GameModel> {
        return repository.getDetailGame(by: id)
    }
    
    func updateFavoriteGame() -> Observable<GameModel> {
        return repository.updateFavoriteGame(by: id)
    }
}
