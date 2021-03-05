//
//  DetailGameInteractor.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift

protocol GameDetailUseCase {
    func getMovieDetail() -> Observable<GameDetailModel>
    func updateFavoriteGame() -> Observable<GameDetailModel>
}

class GameDetailInteractor: GameDetailUseCase {
    
    private let repository: GameRepositoryProtocol
    private let id: Int
    
    required init(by id: Int, repository: GameRepositoryProtocol) {
        self.id = id
        self.repository = repository
    }
    
    func getMovieDetail() -> Observable<GameDetailModel> {
        return repository.getDetailGame(by: id)
    }
    
    func updateFavoriteGame() -> Observable<GameDetailModel> {
        return repository.updateFavoriteGame(by: id)
    }
}
