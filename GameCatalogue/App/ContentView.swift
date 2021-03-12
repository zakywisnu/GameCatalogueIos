//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    let homePresenter: HomePresenter
    let favoritePresenter: FavoritePresenter
    
    var body: some View {
        TabView {
            NavigationView{
                HomeView(presenter: homePresenter)
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView{
                FavoriteView(presenter: favoritePresenter)
            }.tabItem {
                Image(systemName: "heart")
                Text("Favorite")
            }
            
            NavigationView{
                ProfileView()
            }.tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}
