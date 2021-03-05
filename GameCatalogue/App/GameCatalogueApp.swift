//
//  GameCatalogueApp.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import SwiftUI

@main
struct GameCatalogueApp: App {
    let homePresenter = HomePresenter(gameUseCase: Injection.init().provideHome())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite())
    
    var body: some Scene {
        WindowGroup {
            ContentView(homePresenter: homePresenter, favoritePresenter: favoritePresenter)
        }
    }
}
