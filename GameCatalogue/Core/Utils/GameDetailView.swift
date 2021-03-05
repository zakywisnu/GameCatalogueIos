//
//  GameDetailView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameDetailView: View {
    var game: GameDetailModel
    @State var show: Bool
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                ZStack {
                    WebImage(url: URL(string: game.image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .trailing){
                        if game.favorite {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart")
                                .font(.system(size: 40))
                        }
                    }
                    .offset(x: 140,y: 115)
                }
                
                HStack{
                    VStack {
                        HStack {
                            Text(game.name)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(width: 150, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            Spacer()
                            
                            RingView(width: 44, height: 44, percent: CGFloat(game.rating), show: show)
                                .padding()
                                .animation(Animation.easeInOut.delay(0.5))
                        }
                        
                        HStack{
                            Text(game.released)
                                .font(.body)
                                .padding(.leading,10)
                            Spacer()
                            HStack(spacing: 10){
                                Image(systemName: "gamecontroller.fill")
                                Text("\(game.playtime)")
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
                
                
                Text(game.description.replacingOccurrences(of: "<[^>]+>", with: "",options: .regularExpression, range: nil))
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

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(game:
                        GameDetailModel(
                            id: 3498,
                            name: "Grand Theft Auto V",
                            description: "<p>Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. <br />\nSimultaneous storytelling from three unique perspectives: <br />\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. <br />\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.</p>", released: "2013-09-17",
                            image: "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg", rating: 4.48,
                            playtime: 69,
                            favorite: true
                        ), show: true
        )
    }
}
