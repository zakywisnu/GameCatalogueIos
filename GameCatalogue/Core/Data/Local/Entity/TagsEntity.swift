//
//  TagsEntity.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 05/03/21.
//

import Foundation
import RealmSwift

class TagsEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    
}
