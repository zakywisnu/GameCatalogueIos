//
//  DetailView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        ZStack{
            if presenter.isLoading{
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                content
            }
        }.onAppear{
            self.presenter.getDetailGame()
        }
    }
}

extension DetailView {
    var loadingIndicator: some View {
        LoadingView()
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
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                ZStack {
                    WebImage(url: URL(string: presenter.game.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                    VStack(alignment: .trailing){
                        if presenter.game.favorite {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.red)
                                .onTapGesture {
                                    self.presenter.updateFavoriteGame()
                                }
                        } else {
                            Image(systemName: "heart")
                                .font(.system(size: 40))
                                .onTapGesture {
                                    self.presenter.updateFavoriteGame()
                                }
                        }
                    }
                    .offset(x: 140,y: 110)
                }
                
                HStack{
                    VStack {
                        HStack {
                            Text(presenter.game.name)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(width: 150, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            Spacer()
                            
                            RingView(width: 44, height: 44, percent: CGFloat(presenter.game.rating), show: true)
                                .padding()
                                .animation(Animation.easeInOut.delay(0.5))
                        }
                        
                        HStack{
                            Text(presenter.game.released)
                                .font(.body)
                                .padding(.leading,10)
                            Spacer()
                            HStack(spacing: 10){
                                Image(systemName: "gamecontroller.fill")
                                Text("\(presenter.game.playtime)")
                                    .font(.body)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.horizontal, 10)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.horizontal, 10)
                
                
                Text(presenter.game.gameDescription.replacingOccurrences(of: "<[^>]+>", with: "",options: .regularExpression, range: nil))
                    .padding()
                    .font(.system(size: 15, weight: .light, design: .default))
                    .frame(maxWidth: screen.width - 32)
                    .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding()
                    .offset(y: -25)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
