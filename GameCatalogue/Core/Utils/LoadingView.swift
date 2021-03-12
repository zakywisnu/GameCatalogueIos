//
//  LoadingView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 26/02/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 150, height: 150)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
