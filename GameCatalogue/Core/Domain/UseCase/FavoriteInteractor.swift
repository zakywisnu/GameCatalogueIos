//
//  FavoriteInteractor.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift

protocol FavoriteUseCase {
    func getFavoriteGame() -> Observable<[GameModel]>
}

class FavoriteInteractor: FavoriteUseCase {

    private let repository: GameRepositoryProtocol
    
    required init (repository: GameRepositoryProtocol){
        self.repository = repository
    }
    
    func getFavoriteGame() -> Observable<[GameModel]> {
        return repository.getFavoriteGame()
    }
    
}
