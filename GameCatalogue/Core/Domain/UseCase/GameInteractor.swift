//
//  GameInteractor.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift

protocol GameUseCase {
    func getListGame() -> Observable<[GameModel]>
}

class GameInteractor: GameUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol){
        self.repository = repository
    }
    func getListGame() -> Observable<[GameModel]> {
        return repository.getListGame()
    }
}
