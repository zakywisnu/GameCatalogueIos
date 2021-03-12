//
//  DetailPresenter.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import Foundation
import RxSwift

class DetailPresenter: ObservableObject {
    private let detailUseCase: GameDetailUseCase
    private let disposeBag = DisposeBag()
    
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var game = GameModel(
        id: 0,
        name: "",
        released: "",
        rating: 0,
        image: "",
        playtime: 0,
        gameDescription: "",
        favorite: false
    )
    
    init(detailUseCase: GameDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getDetailGame(){
        isLoading = true
        detailUseCase.getMovieDetail()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                self.game = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isLoading = false
                self.isError = false
            }.disposed(by: disposeBag)
    }
    
    func updateFavoriteGame(){
        detailUseCase.updateFavoriteGame()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                self.game = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
