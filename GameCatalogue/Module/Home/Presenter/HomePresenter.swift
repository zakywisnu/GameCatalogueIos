//
//  HomePresenter.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import Foundation
import SwiftUI
import RxSwift

class HomePresenter: ObservableObject {
    private let gameUseCase: GameUseCase
    private let router = HomeRouter()
    private let disposeBag = DisposeBag()
    
    init(gameUseCase: GameUseCase) {
        self.gameUseCase = gameUseCase
    }
    
    @Published var game: [GameModel] = []
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorMessage = ""
    
    func getListGame() {
        isLoading = true
        gameUseCase.getListGame()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                self.game = result
            } onError: { error in
                self.isError = true
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
                self.isError = false
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View> (
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View{
        NavigationLink(destination: router.makeDetailView(for: game)){
            content()
        }
    }
}
