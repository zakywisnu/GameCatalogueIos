//
//  FavoriteRow.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 28/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteRow: View {
    var game: GameDetailModel
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
