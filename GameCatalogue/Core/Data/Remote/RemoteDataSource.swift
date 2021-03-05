//
//  RemoteDataSource.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RxSwift
import Alamofire

protocol RemoteDataSourceProtocol: class {
    func getListGame() -> Observable<[GameResponse]>
    func getDetailGame(id: Int) -> Observable<GameDetailResponse>
}

final class RemoteDataSource: NSObject {
    private override init() {}
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getListGame() -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create{ observer in
            if let url = URL(string: Endpoints.Gets.listGame.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ListGameResponse.self){ response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getDetailGame(id: Int) -> Observable<GameDetailResponse> {
        return Observable<GameDetailResponse>.create{ observer in
            if let url = URL(string: Endpoints.Gets.detailGame(id: id).url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GameDetailResponse.self){ response in
                        switch response.result{
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
