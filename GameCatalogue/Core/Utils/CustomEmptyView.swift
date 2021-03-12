//
//  CustomEmptyView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 26/02/21.
//

import SwiftUI

struct CustomEmptyView: View {
    var image: String
    var title: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 100)
            
            Text(title)
                .font(.system(.body, design: .rounded))
        }
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView(image: "empty_favorite", title: "Empty Favorite")
    }
}
