//
//  HomeRouter.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import Foundation
import SwiftUI

class HomeRouter{
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(by: game.id)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
}
