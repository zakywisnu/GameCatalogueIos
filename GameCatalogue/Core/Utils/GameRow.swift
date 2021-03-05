//
//  GameRow.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 26/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
    var game: GameModel
    var body: some View{
        ZStack {
            WebImage(url: URL(string: game.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                
            VStack {
                Spacer()
                HStack {
                    Text(game.name)
                        .font(.system(size: 16, weight: .black, design: .default))
                        .frame(width: 175, height: 100)
                        .foregroundColor(Color.black.opacity(0.8))
                        .padding()
                    Spacer()
                    
                    RingView(width: 44, height: 44, percent: CGFloat(game.rating), show: true)
                        .padding()
                        .animation(Animation.easeInOut.delay(0.5))
                }
                .frame(height: 60)
                .background(Color.white.opacity(0.5))
                
            }
        }
        .frame(width: 350, height: 200)
        .padding(.horizontal,32)
    }
    
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: GameModel(id: 3498,
                                name: "Grand Theft Auto V",
                                 released: "2013-09-17",
                                 rating: 4.48,
                                 image: "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg",
                                playtime: 69)
        )
    }
}
