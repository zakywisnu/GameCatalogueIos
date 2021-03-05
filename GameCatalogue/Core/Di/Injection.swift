//
//  Injection.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RealmSwift

final class Injection : NSObject {
    private func provideRepository() -> GameRepositoryProtocol {
        let realm = try? Realm()

        let locale: LocalDataSource = LocalDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance

        return GameRepository.sharedInstance(locale,remote)
    }

    func provideHome() -> GameUseCase {
        let repository = provideRepository()
        return GameInteractor(repository: repository)
    }

    func provideDetail(by id: Int) -> GameDetailUseCase {
        let repository = provideRepository()
        return GameDetailInteractor(by: id, repository: repository)
    }
    func provideFavorite() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
}
