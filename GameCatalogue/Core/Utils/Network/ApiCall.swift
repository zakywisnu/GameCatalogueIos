//
//  ApiCall.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation

struct Api {
    static let baseUrl = "https://api.rawg.io/api/"
}

protocol Endpoint {
    var url: String {get}
}

enum Endpoints {
    enum Gets: Endpoint {
        
        case listGame
        case detailGame(id:Int)
        public var url: String {
            switch self {
            case .listGame:
                return "\(Api.baseUrl)games"
            case .detailGame(let id):
                return "\(Api.baseUrl)games/\(id)"
            }
        }
    }
}
