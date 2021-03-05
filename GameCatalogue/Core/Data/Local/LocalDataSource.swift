//
//  LocalDataSource.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift
import RealmSwift

protocol LocalDataSourceProtocol: class {
    func getListGame() -> Observable<[GameEntity]>
    func getDetailGame(id: Int) -> Observable<GameDetailEntity>
    func addListGame(from listGame: [GameEntity]) -> Observable<Bool>
    func addDetailGame(from detailGame: GameDetailEntity) -> Observable<Bool>
    func getFavoriteGame() -> Observable<[GameDetailEntity]>
    func updateFavoriteGame(by idGame: Int) -> Observable<GameDetailEntity>
//    func updateDetailGame(by idGame: Int, from game: GameDetailEntity) -> Observable<Bool>
}

final class LocalDataSource: NSObject {
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> LocalDataSource = { realmDatabase in
        return LocalDataSource(realm: realmDatabase)
    }
}

extension LocalDataSource: LocalDataSourceProtocol {
//    func updateDetailGame(by idGame: Int, from game: GameDetailEntity) -> Observable<Bool> {
//        <#code#>
//    }
    
    func getListGame() -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create{ observer in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: GameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func getFavoriteGame() -> Observable<[GameDetailEntity]> {
        return Observable<[GameDetailEntity]>.create{ observer in
            if let realm = self.realm {
                let games: Results<GameDetailEntity> = {
                    realm.objects(GameDetailEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: GameDetailEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    
    func getDetailGame(id: Int) -> Observable<GameDetailEntity> {
        return Observable<GameDetailEntity>.create{ observer in
            if let realm = self.realm {
                let games: Results<GameDetailEntity> = {
                    realm.objects(GameDetailEntity.self)
                        .filter("id = \(id)")
                }()
                if let game = games.first {
                    observer.onNext(game)
                    observer.onCompleted()
                } else {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addListGame(from listGame: [GameEntity]) -> Observable<Bool> {
        return Observable<Bool>.create{ observer in
            if let realm = self.realm {
                do {
                    try realm.write{
                        for game in listGame {
                            realm.add(game, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addDetailGame(from detailGame: GameDetailEntity) -> Observable<Bool> {
        return Observable<Bool>.create{ observer in
            if let realm = self.realm {
                do {
                    try realm.write{
                        realm.add(detailGame, update: .all)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    
    func updateFavoriteGame(by idGame: Int) -> Observable<GameDetailEntity> {
        return Observable<GameDetailEntity>.create{ observer in
            if let realm = self.realm, let gameEntity = {
                realm.objects(GameDetailEntity.self).filter("id = \(idGame)")
            }().first {
                do {
                    try realm.write{
                        gameEntity.setValue(!gameEntity.favorite, forKey: "favorite")
                    }
                    observer.onNext(gameEntity)
                    observer.onCompleted()
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
