//
//  FavoriteView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePresenter
    
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
            self.presenter.getFavoriteGame()
        }.navigationBarTitle(
            Text("List Game"), displayMode: .automatic
        )
    }
}

extension FavoriteView {
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
                        FavoriteRow(game: item)
                    })
                }.padding(10)
            }
        }
    }
}
