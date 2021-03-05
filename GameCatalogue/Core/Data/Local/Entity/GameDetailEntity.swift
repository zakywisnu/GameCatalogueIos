//
//  GameDetailEntity.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import Foundation
import RealmSwift

class GameDetailEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var gameDescription: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var rating: Double = 0
    @objc dynamic var playtime: Int = 0
    @objc dynamic var favorite: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

