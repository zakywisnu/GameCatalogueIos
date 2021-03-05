//
//  HomeView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        ZStack{
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.game.isEmpty {
                emptyIndicator
            } else {
                content
            }
        }.onAppear{
            if self.presenter.game.count == 0 {
                self.presenter.getListGame()
            }
        }.navigationBarTitle(
            Text("List Game"), displayMode: .automatic
        )
    }
}

extension HomeView{
    var loadingIndicator: some View {
        LoadingView()
    }
    var emptyIndicator: some View {
        CustomEmptyView(image: "empty_favorite", title: "The Movie Favorite is Empty")
    }
    var errorIndicator: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 100)
            
            Text(presenter.errorMessage)
                .font(.system(.body, design: .rounded))
        }
    }
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(self.presenter.game, id: \.id) { item in
                ZStack{
                    self.presenter.linkBuilder(for: item, content: {
                        GameRow(game: item)
                    })
                }.padding(10)
            }
        }
    }
}
