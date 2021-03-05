//
//  FavoritePresenter.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import Foundation
import SwiftUI
import RxSwift

class FavoritePresenter: ObservableObject {
    private let favoriteUseCase: FavoriteUseCase
    private let router = FavoriteRouter()
    private let disposeBag = DisposeBag()
    
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var game: [GameDetailModel] = []
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavoriteGame() {
        isLoading = true
        favoriteUseCase.getFavoriteGame()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                self.game = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                self.isError = true
            } onCompleted: {
                self.isLoading = false
                self.isError = false
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(
        for game: GameDetailModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeDetailView(for: game)){
            content()
        }
    }
}
